﻿/*	-------------------------------------------------------------------------------------------------------
	� 1991-2012 Take-Two Interactive Software and its subsidiaries.  Developed by Firaxis Games.  
	Sid Meier's Civilization V, Civ, Civilization, 2K Games, Firaxis Games, Take-Two Interactive Software 
	and their respective logos are all trademarks of Take-Two interactive Software, Inc.  
	All other marks and trademarks are the property of their respective owners.  
	All rights reserved. 
	------------------------------------------------------------------------------------------------------- */
#pragma once

//
//  AUTHOR:  Casey O'Toole  --  8/21/2002
//
//  PURPOSE: A* Pathfinding - based off of A* Explorer from "AI Game Programming Wisdom"
//

#ifndef		CVASTAR_H
#define		CVASTAR_H
#pragma		once

#include	"CvAStarNode.h"

class CvUnit;
class CvPlot;

enum PathType
{
	PT_UNIT_WITH_ZOC,			//path for a particular unit with ZoC rules (stacking is handled via flag)
	PT_UNIT_IGNORE_OTHERS,		//path for a unit, disregarding other units (no stacking and no ZoC)
	PT_GENERIC_SAME_AREA,		//plots must have the same area ID (ie only water or only land)
	PT_GENERIC_ANY_AREA,		//plots can have any area ID, simply need to be passable
	PT_GENERIC_SAME_AREA_WIDE,	//path must be 3 tiles wide (for armies)
	PT_GENERIC_ANY_AREA_WIDE,	//same for any area
	PT_TRADE_WATER,				//water trade
	PT_TRADE_LAND,				//land trade
	PT_BUILD_ROUTE,				//prospective route
	PT_AREA_CONNECTION,			//assign area IDs to connected plots (hack)
	PT_LANDMASS_CONNECTION,		//assign landmass IDs to connected plots (hack)
	PT_CITY_INFLUENCE,			//which plot is next for a city to expand it's borders
	PT_CITY_ROUTE_LAND,			//is there a road or railroad between two points
	PT_CITY_ROUTE_WATER,		//is there a sea connection between two points
	PT_CITY_ROUTE_MIXED,		//is there a mixed land/sea connection between two points
	PT_AIR_REBASE,				//for aircraft, only plots with cities and carriers are allowed
	PT_UI_PLOT_MOVE_HIGHLIGHT,	//mark all hexes in move range
	PT_UI_PLOT_ATTACK_HIGHLIGHT,//mark all hexes in attack range
	PT_UI_PATH_VISUALIZATION	//draw the computed path
};

#define PATH_BASE_COST (100) //base cost per plot respectively movement point expended

//-------------------------------------------------------------------------------------------------
// All information which might be required for a given path
//-------------------------------------------------------------------------------------------------
struct SPathFinderUserData
{
	SPathFinderUserData() : ePathType(PT_GENERIC_ANY_AREA), iFlags(0), ePlayer(NO_PLAYER), iUnitID(0), iTypeParameter(-1), iMaxTurns(INT_MAX), iMaxNormalizedDistance(INT_MAX) {}
	SPathFinderUserData(const CvUnit* pUnit, int iFlags=0, int iMaxTurns=INT_MAX);
	SPathFinderUserData(PlayerTypes ePlayer, PathType ePathType, int iTypeParameter=-1, int iMaxTurns=INT_MAX);

	//do not compare max turns and max cost ...
	bool operator==(const SPathFinderUserData& rhs) const 
		{ return ePathType==rhs.ePathType && iFlags==rhs.iFlags && ePlayer==rhs.ePlayer && iUnitID==rhs.iUnitID && iTypeParameter==rhs.iTypeParameter; }
	bool operator!=(const SPathFinderUserData& rhs) const { return !(*this==rhs); }

	PathType	ePathType;
	int			iTypeParameter;		//route type dependent parameter
	int			iFlags;				//see CvUnit::MOVEFLAG*
	PlayerTypes ePlayer;			//optional
	int			iUnitID;			//optional
	int			iMaxTurns;
	int			iMaxNormalizedDistance;
};


//-------------------------------------------------------------------------------------------------
// Simple structure to hold a pathfinding result
//-------------------------------------------------------------------------------------------------
struct SPath
{
	std::vector<std::pair<int,int>> vPlots;
	int iNormalizedDistance;
	int iTurnGenerated;
	SPathFinderUserData sConfig;
};

typedef int(*CvAPointFunc)(int, int, const SPathFinderUserData&, const CvAStar*);
typedef int(*CvAHeuristic)(int, int, int, int, int, int);
typedef int(*CvAStarFunc)(CvAStarNode*, CvAStarNode*, int, const SPathFinderUserData&, CvAStar*);
typedef int(*CvAStarConst1Func)(const CvAStarNode*, CvAStarNode*, int, const SPathFinderUserData&, const CvAStar*);
typedef int(*CvAStarConst2Func)(const CvAStarNode*, const CvAStarNode*, int, const SPathFinderUserData&, const CvAStar*);
typedef int(*CvANumExtraChildren)(const CvAStarNode*, const CvAStar*);
typedef int(*CvAGetExtraChild)(const CvAStarNode*, int, int&, int&, const CvAStar*);
typedef void(*CvABegin)(const SPathFinderUserData&, CvAStar*);
typedef void(*CvAEnd)(const SPathFinderUserData&, CvAStar*);

enum NodeState
{
	NS_INITIAL_FINAL = 0,
	NS_CURRENT = 1,
	NS_VALID = 2,
	NS_INVALID = 3,
	NS_OBSOLETE = 4,
	NS_FORBIDDEN = 5,
};

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//  CLASS:      CvAStar
//
//  DESC:       Generic pathfinding algorithm
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class CvAStar
{

	//--------------------------------------- PUBLIC METHODS -------------------------------------------
public:
	CvAStar();
	~CvAStar();

	// allocate memory
	void Initialize(int iColumns, int iRows, bool bWrapX, bool bWrapY);
	void DeInit();

	// Generates a route
	virtual bool GeneratePathWithCurrentConfiguration(int iXstart, int iYstart, int iXdest, int iYdest, const SPathFinderUserData& data);

	// Gets the last node in the path (from the origin) - Traverse the parents to get full path (linked list starts at destination)
	inline CvAStarNode* GetLastNode() const
	{
		return m_pBest;
	}

	inline int GetPathTurns() const
	{
		if( udNotifyChild && GetLastNode() )
			return GetLastNode()->m_iTurns;
		else
			return INT_MAX;
	}

	inline int GetPathLength() const
	{
		if (m_pBest)
		{
			int iLength = 0;
			const CvAStarNode* pCurrent = m_pBest;
			while (pCurrent)
			{
				iLength++;
				pCurrent = pCurrent->m_pParent;
			}
			return iLength;
		}
		else
			return INT_MAX;
	}

	inline int GetNormalizedLength() const
	{
		if (m_pBest)
		{
			int iCost = m_pBest->m_iKnownCost;
			return iCost / m_iBasicPlotCost;
		}
		else
			return INT_MAX;
	}

	inline bool HaveFlag(int iFlag) const
	{
		return ((m_sData.iFlags & iFlag)==iFlag);
	}

	virtual const char* GetName() const { return m_strName.c_str(); }
	virtual void SetName(const char* pName) { m_strName = pName; }

	const void* GetScratchBuffer() const { return m_ScratchBuffer; }
	void* GetScratchBufferDirty() { return m_ScratchBuffer; }

	inline int GetStartX() const
	{
		return m_iXstart;
	}

	inline int GetStartY() const
	{
		return m_iYstart;
	}

	inline int GetDestX() const
	{
		return m_iXdest;
	}

	inline int GetDestY() const
	{
		return m_iYdest;
	}

	inline bool IsPathStart(int iX, int iY) const
	{
		return ((m_iXstart == iX) && (m_iYstart == iY));
	}

	inline bool IsPathDest(int iX, int iY) const
	{
		if(udIsPathDest && udIsPathDest(iX, iY, m_sData, this))
		{
			return TRUE;
		}
		return FALSE;
	}

	inline unsigned short GetCurrentGenerationID() const
	{
		return m_iCurrentGenerationID;
	}

	inline int GetNumExtraChildren(const CvAStarNode* node) const
	{
		if (udNumExtraChildrenFunc && udGetExtraChildFunc)
			return udNumExtraChildrenFunc(node, this);
		else
			return 0;
	}

	CvAStarNode* GetExtraChild(const CvAStarNode* node, int i) const
	{
		if (udNumExtraChildrenFunc && udGetExtraChildFunc)
		{
			int x,y;
			udGetExtraChildFunc(node, i, x, y, this);
			if(isValid(x, y))
				return &(m_ppaaNodes[x][y]);
		}

		return 0;
	}

	void AddToOpen(CvAStarNode* addnode);

	inline const SPathFinderUserData& GetData() const
	{
		return m_sData;
	}

	//--------------------------------------- PROTECTED FUNCTIONS -------------------------------------------
protected:

	virtual void SetFunctionPointers(CvAPointFunc IsPathDestFunc, CvAPointFunc DestValidFunc, CvAHeuristic HeuristicFunc, 
		CvAStarConst1Func CostFunc, CvAStarConst2Func ValidFunc, CvAStarFunc NotifyChildFunc, CvAStarFunc NotifyListFunc, 
		CvANumExtraChildren NumExtraChildrenFunc, CvAGetExtraChild GetExtraChildFunc, CvABegin InitializeFunc, CvAEnd UninitializeFunc);

	void    Reset()
	{
		m_pBest = NULL;
	}

	CvAStarNode*	GetBest();

	void CreateChildren(CvAStarNode* node);
	NodeState LinkChild(CvAStarNode* node, CvAStarNode* check);
	void UpdateOpenNode(CvAStarNode* node);
	void UpdateParents(CvAStarNode* node);

	void Push(CvAStarNode* node);
	CvAStarNode* Pop();

	inline int xRange(int iX) const;
	inline int yRange(int iY) const;
	inline bool isValid(int iX, int iY) const;

	void PrecalcNeighbors(CvAStarNode* node);

	inline int udFunc(CvAStarFunc func, CvAStarNode* param1, CvAStarNode* param2, int operation, const SPathFinderUserData& data);
	inline int udFunc(CvAStarConst1Func func, const CvAStarNode* param1, CvAStarNode* param2, int operation, const SPathFinderUserData& data) const;
	inline int udFunc(CvAStarConst2Func func, const CvAStarNode* param1, const CvAStarNode* param2, int operation, const SPathFinderUserData& data) const;

	//--------------------------------------- PROTECTED DATA -------------------------------------------
protected:
	CvAPointFunc udIsPathDest;					// Determines if this node is the destination of the path
	CvAPointFunc udDestValid;				    // Determines destination is valid
	CvAHeuristic udHeuristic;				    // Determines heuristic cost
	CvAStarConst1Func udCost;					// Called when cost value is need
	CvAStarConst2Func udValid;					// Called to check validity of a coordinate
	CvAStarFunc udNotifyChild;				    // Called when child is added/checked (LinkChild)
	CvAStarFunc udNotifyList;				    // Called when node is added to Open/Closed list
	CvANumExtraChildren udNumExtraChildrenFunc; // Determines if CreateChildren should consider any additional nodes
	CvAGetExtraChild udGetExtraChildFunc;	    // Get the extra children nodes
	CvABegin udInitializeFunc;					// Called at the start, to initialize any run specific data
	CvAEnd udUninitializeFunc;					// Called at the end to uninitialize any run specific data

	SPathFinderUserData m_sData;				// Data passed back to functions
	unsigned short m_iCurrentGenerationID;		// the cache in each node is tagged with a generation ID which is incremented for each call

	int m_iColumns;	
	int m_iRows;
	int m_iXstart;
	int m_iYstart;
	int m_iXdest;
	int m_iYdest;

	bool m_bWrapX;
	bool m_bWrapY;

	CvAStarNode* m_pOpen;           // The open list
	CvAStarNode* m_pOpenTail;       // The open list tail pointer (to speed up inserts)
	CvAStarNode* m_pClosed;         // The closed list
	CvAStarNode* m_pBest;           // The best node
	CvAStarNode* m_pStackHead;		// The Push/Pop stack head

	int m_iProcessedNodes;			// for statistics
	int m_iTestedNodes;
	int m_iRounds;

	CvAStarNode** m_ppaaNodes;
	CvAStarNode** m_ppaaNeighbors;

	// Scratch buffer
	char  m_ScratchBuffer[512];	// Will NOT be modified directly by CvAStar

	int m_iBasicPlotCost;		// for length normalization

	//for debugging
	CvString m_strName;
};

// Copy the supplied node and its parent nodes into an array of simpler path nodes for caching purposes.
// It is ok to pass in NULL, the resulting array will contain zero elements
void CopyPath(const CvAStarNode* pkEndNode, CvPathNodeArray& kPathArray);

inline int CvAStar::xRange(int iX) const
{
	if(m_bWrapX)
	{
		if(iX < 0)
		{
			return (m_iColumns + (iX % m_iColumns));
		}
		else if(iX >= m_iColumns)
		{
			return (iX % m_iColumns);
		}
		else
		{
			return iX;
		}
	}
	else
	{
		return iX;
	}
}


inline int CvAStar::yRange(int iY) const
{
	if(m_bWrapY)
	{
		if(iY < 0)
		{
			return (m_iRows + (iY % m_iRows));
		}
		else if(iY >= m_iRows)
		{
			return (iY % m_iRows);
		}
		else
		{
			return iY;
		}
	}
	else
	{
		return iY;
	}
}


inline bool CvAStar::isValid(int iX, int iY) const
{
	if((iX < 0) || (iX >= m_iColumns))
	{
		return false;
	}

	if((iY < 0) || (iY >= m_iRows))
	{
		return false;
	}

	return true;
}

inline int CvAStar::udFunc(CvAStarFunc func, CvAStarNode* param1, CvAStarNode* param2, int operation, const SPathFinderUserData& data)
{
	return (func) ? func(param1, param2, operation, data, this) : PATH_BASE_COST;
}

inline int CvAStar::udFunc(CvAStarConst1Func func, const CvAStarNode* param1, CvAStarNode* param2, int operation, const SPathFinderUserData& data) const
{
	return (func) ? func(param1, param2, operation, data, this) : PATH_BASE_COST;
}

inline int CvAStar::udFunc(CvAStarConst2Func func, const CvAStarNode* param1, const CvAStarNode* param2, int operation, const SPathFinderUserData& data) const
{
	return (func) ? func(param1, param2, operation, data, this) : PATH_BASE_COST;
}

//-------------------------------------------------------------------------------------------------
// Derived class with some additional convenience functions
//-------------------------------------------------------------------------------------------------
class CvPathFinder : public CvAStar
{
public:
	// set the function pointers which do the actual work
	virtual bool Configure(PathType ePathType);

	// configures the AStar implementation according to the desired PathType and generates a path
	virtual bool GeneratePath(int iXstart, int iYstart, int iXdest, int iYdest, const SPathFinderUserData& data);
	virtual bool DoesPathExist(const CvPlot* pStartPlot, const CvPlot* pEndPlot, const SPathFinderUserData& data);

	SPath GetPath() const;
	bool VerifyPath(const SPath& path);

	// Can be called after a route has been generated
	CvPlot* GetXPlotsFromEnd(int iPlotsFromEnd, bool bLeaveEnemyTerritory) const;
	int CountPlotsOwnedByXInPath(PlayerTypes ePlayer) const;
	int CountPlotsOwnedAnyoneInPath(PlayerTypes eExceptPlayer) const;
	CvPlot* GetPathFirstPlot() const;
	CvPlot* GetPathEndTurnPlot() const;
};

//-------------------------------------------------------------------------------------------------
// Since units may stop at any point on their path before their movement points are exhausted, we need to have two layers of nodes, one with a hypothetical stop, one without.
// Usecase is eg a unit blocking a road tile, so we cannot end the turn there. The best solution is to waste some movement points and pass the blocking unit in the next turn.
//-------------------------------------------------------------------------------------------------
class CvTwoLayerPathFinder: public CvPathFinder
{
public:
	CvTwoLayerPathFinder();
	~CvTwoLayerPathFinder();
	void Initialize(int iColumns, int iRows, bool bWrapX, bool bWrapY);
	void DeInit();

	// set the function pointers which do the actual work
	virtual bool Configure(PathType ePathType);

	CvAStarNode* GetPartialMoveNode(int iCol, int iRow);

private:
	CvAStarNode** m_ppaaPartialMoveNodes;
};


// C-style non-member functions (used by path finder)
int DestinationReached(int iToX, int iToyY, const SPathFinderUserData& data, const CvAStar* finder);

int PathDestValid(int iToX, int iToY, const SPathFinderUserData& data, const CvAStar* finder);
int PathValid(const CvAStarNode* parent, const CvAStarNode* node, int operation, const SPathFinderUserData& data, const CvAStar* finder);
int PathHeuristic(int iCurrentX, int iCurrentY, int iNextX, int iNextY, int iDestX, int iDestY);
int PathCost(const CvAStarNode* parent, CvAStarNode* node, int operation, const SPathFinderUserData& data, const CvAStar* finder);
int PathAdd(CvAStarNode* parent, CvAStarNode* node, int operation, const SPathFinderUserData& data, CvAStar* finder);
int PathNodeAdd(CvAStarNode* parent, CvAStarNode* node, int operation, const SPathFinderUserData& data, CvAStar* finder);

int IgnoreUnitsDestValid(int iToX, int iToY, const SPathFinderUserData& data, const CvAStar* finder);
int IgnoreUnitsCost(const CvAStarNode* parent, CvAStarNode* node, int operation, const SPathFinderUserData& data, const CvAStar* finder);
int IgnoreUnitsValid(const CvAStarNode* parent, const CvAStarNode* node, int operation, const SPathFinderUserData& data, const CvAStar* finder);

int StepHeuristic(int iCurrentX, int iCurrentY, int iNextX, int iNextY, int iDestX, int iDestY);
int StepDestValid(int iToX, int iToY, const SPathFinderUserData& data, const CvAStar* finder);
int StepValid(const CvAStarNode* parent, const CvAStarNode* node, int operation, const SPathFinderUserData& data, const CvAStar* finder);
int StepValidAnyArea(const CvAStarNode* parent, const CvAStarNode* node, int operation, const SPathFinderUserData& data, const CvAStar* finder);
int StepValidWide(const CvAStarNode* parent, const CvAStarNode* node, int, const SPathFinderUserData& data, const CvAStar* finder);
int StepValidWideAnyArea(const CvAStarNode* parent, const CvAStarNode* node, int, const SPathFinderUserData& data, const CvAStar* finder);
int StepCost(const CvAStarNode* parent, CvAStarNode* node, int operation, const SPathFinderUserData& data, const CvAStar* finder);
int StepAdd(CvAStarNode* parent, CvAStarNode* node, int operation, const SPathFinderUserData& data, CvAStar* finder);

int RouteValid(const CvAStarNode* parent, const CvAStarNode* node, int operation, const SPathFinderUserData& data, const CvAStar* finder);
int RouteGetNumExtraChildren(const CvAStarNode* node, const CvAStar* finder);
int RouteGetExtraChild(const CvAStarNode* node, int iIndex, int& iX, int& iY, const CvAStar* finder);
int WaterRouteValid(const CvAStarNode* parent, const CvAStarNode* node, int operation, const SPathFinderUserData& data, const CvAStar* finder);

int AreaValid(const CvAStarNode* parent, const CvAStarNode* node, int operation, const SPathFinderUserData& data, const CvAStar* finder);
int JoinArea(CvAStarNode* parent, CvAStarNode* node, int operation, const SPathFinderUserData& data, CvAStar* finder);
int LandmassValid(const CvAStarNode* parent, const CvAStarNode* node, int operation, const SPathFinderUserData& data, const CvAStar* finder);
int JoinLandmass(CvAStarNode* parent, CvAStarNode* node, int operation, const SPathFinderUserData& data, CvAStar* finder);

int InfluenceDestValid(int iToX, int iToY, const SPathFinderUserData& data, const CvAStar* finder);
int InfluenceValid(const CvAStarNode* parent, const CvAStarNode* node, int operation, const SPathFinderUserData& data, const CvAStar* finder);
int InfluenceCost(const CvAStarNode* parent, CvAStarNode* node, int operation, const SPathFinderUserData& data, const CvAStar* finder);

int BuildRouteCost(const CvAStarNode* parent, CvAStarNode* node, int operation, const SPathFinderUserData& data, const CvAStar* finder);
int BuildRouteValid(const CvAStarNode* parent, const CvAStarNode* node, int operation, const SPathFinderUserData& data, const CvAStar* finder);

int UIPathAdd(CvAStarNode* parent, CvAStarNode* node, int operation, const SPathFinderUserData& data, CvAStar* finder);
int UIAttackPathAdd(CvAStarNode* parent, CvAStarNode* node, int operation, const SPathFinderUserData& data, CvAStar* finder);
int UIPathValid(const CvAStarNode* parent, const CvAStarNode* node, int operation, const SPathFinderUserData& data, const CvAStar* finder);

int RebaseValid(const CvAStarNode* parent, const CvAStarNode* node, int operation, const SPathFinderUserData& data, const CvAStar* finder);
int RebaseGetNumExtraChildren(const CvAStarNode* node,  const CvAStar* finder);
int RebaseGetExtraChild(const CvAStarNode* node, int iIndex, int& iX, int& iY, const CvAStar* finder);

int TradeRouteLandPathCost(const CvAStarNode* parent, CvAStarNode* node, int operation, const SPathFinderUserData& data, const CvAStar* finder);
int TradeRouteLandValid(const CvAStarNode* parent, const CvAStarNode* node, int operation, const SPathFinderUserData& data, const CvAStar* finder);
int TradeRouteWaterPathCost(const CvAStarNode* parent, CvAStarNode* node, int operation, const SPathFinderUserData& data, const CvAStar* finder);
int TradeRouteWaterValid(const CvAStarNode* parent, const CvAStarNode* node, int operation, const SPathFinderUserData& data, const CvAStar* finder);

void UnitPathInitialize(const SPathFinderUserData& data, CvAStar* finder);
void UnitPathUninitialize(const SPathFinderUserData& data, CvAStar* finder);
void TradePathInitialize(const SPathFinderUserData& data, CvAStar* finder);
void TradePathUninitialize(const SPathFinderUserData& data, CvAStar* finder);

//helper functions
bool IsPlotConnectedToPlot(PlayerTypes ePlayer, CvPlot* pFromPlot, CvPlot* pToPlot, RouteTypes eRestrictRoute = ROUTE_ANY, bool bIgnoreHarbors = false, SPath* pPathOut = NULL);

#endif	//CVASTAR_H
