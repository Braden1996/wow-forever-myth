--!strict
local Maybe = require("@truemyth/Maybe")
local Reuse = require("../Runtime/Reuse")

type Maybe<T> = Maybe.Maybe<T>

export type BNGetFOFInfoResults = {
	read friendID: number,
	read accountName: string,
	read isMutual: boolean,
}

export type BNGetInfoResults = {
	read presenceID: Maybe<number>,
	read battleTag: string,
	read toonID: number,
	read currentBroadcast: string,
	read bnetAFK: boolean,
	read bnetDND: boolean,
	read isRIDEnabled: boolean,
}

export type BNGetNumFriendsResults = {
	read numBNetTotal: number,
	read numBNetOnline: number,
	read numBNetFavorite: number,
	read numBNetFavoriteOnline: number,
}

export type CanChangePlayerDifficultyResults = {
	read canChange: boolean,
	read notOnCooldown: boolean,
}

export type CanLootUnitResults = {
	read hasLoot: boolean,
	read canLoot: boolean,
}

export type ClosestGameObjectPositionResults = {
	read xPos: number,
	read yPos: number,
	read distance: number,
}

export type ClosestUnitPositionResults = {
	read xPos: number,
	read yPos: number,
	read distance: number,
}

export type EJ_GetCreatureInfoResults = {
	read id: number,
	read name: string,
	read description: string,
	read displayInfo: number,
	read iconImage: number,
	read uiModelSceneID: number,
}

export type EJ_GetEncounterInfoResults = {
	read name: string,
	read description: string,
	read journalEncounterID: number,
	read rootSectionID: number,
	read link: string,
	read journalInstanceID: number,
	read dungeonEncounterID: number,
	read instanceID: number,
}

export type EJ_GetEncounterInfoByIndexResults = {
	read name: string,
	read description: string,
	read journalEncounterID: number,
	read rootSectionID: number,
	read link: string,
	read journalInstanceID: number,
	read dungeonEncounterID: number,
	read instanceID: number,
}

export type EJ_GetInstanceByIndexResults = {
	read instanceID: number,
	read name: string,
	read description: string,
	read bgImage: number,
	read buttonImage1: number,
	read loreImage: number,
	read buttonImage2: number,
	read dungeonAreaMapID: number,
	read link: string,
	read shouldDisplayDifficulty: boolean,
	read mapID: number,
	read covenantID: number,
	read isRaid: boolean,
}

export type EJ_GetInstanceInfoResults = {
	read name: string,
	read description: string,
	read bgImage: number,
	read buttonImage1: number,
	read loreImage: number,
	read buttonImage2: number,
	read dungeonAreaMapID: number,
	read link: string,
	read shouldDisplayDifficulty: boolean,
	read mapID: number,
	read covenantID: number,
	read isRaid: boolean,
}

export type EJ_GetLootFilterResults = {
	read classID: number,
	read specID: number,
}

export type EJ_GetMapEncounterResults = {
	read x: number,
	read y: number,
	read instanceID: number,
	read name: string,
	read description: string,
	read encounterID: number,
	read rootSectionID: number,
	read link: string,
}

export type EJ_GetSearchResultResults = {
	read id: number,
	read stype: number,
	read difficultyID: number,
	read instanceID: number,
	read encounterID: number,
	read itemLink: string,
}

export type EJ_GetSectionPathResults = {
	read sectionID: number,
	read parent1SectionID: Maybe<number>,
	read parent2SectionID: Maybe<number>,
	read rootSectionID: Maybe<number>,
}

export type EJ_GetTierInfoResults = {
	read name: string,
	read link: string,
}

export type EJ_HandleLinkPathResults = {
	read instanceID: number,
	read encounterID: Maybe<number>,
	read sectionID: Maybe<number>,
	read tierIndex: Maybe<number>,
}

export type FindInTableIfResults = {
	read key: string | number,
	read value: unknown,
}

export type GetAchievementComparisonInfoResults = {
	read completed: boolean,
	read month: number,
	read day: number,
	read year: number,
}

export type GetAchievementCriteriaInfoResults = {
	read criteriaString: string,
	read criteriaType: number,
	read completed: boolean,
	read quantity: number,
	read reqQuantity: number,
	read charName: string,
	read flags: number,
	read assetID: number,
	read quantityString: string,
	read criteriaID: number,
	read eligible: boolean,
	read duration: number,
	read elapsed: number,
}

export type GetAchievementCriteriaInfoByIDResults = {
	read criteriaString: string,
	read criteriaType: number,
	read completed: boolean,
	read quantity: number,
	read reqQuantity: number,
	read charName: string,
	read flags: number,
	read assetID: number,
	read quantityString: string,
	read criteriaID: number,
	read eligible: boolean,
	read duration: number,
	read elapsed: number,
}

export type GetAchievementGuildRepResults = {
	read requiresRep: boolean,
	read hasRep: boolean,
	read repLevel: number,
}

export type GetActionBarTogglesResults = {
	read bar1: boolean,
	read bar2: boolean,
	read bar3: boolean,
	read bar4: boolean,
	read bar5: boolean,
	read bar6: boolean,
	read bar7: boolean,
}

export type GetActionInfoResults = {
	read actionType: string,
	read id: number | string,
	read subType: string,
}

export type GetActiveArtifactByRaceResults = {
	read artifactName: string,
	read artifactDescription: string,
	read artifactRarity: string,
	read artifactIcon: string,
	read hoverDescription: string,
	read keystoneCount: number,
	read bgTexture: string,
}

export type GetArchaeologyRaceInfoResults = {
	read raceName: string,
	read raceTexture: number,
	read raceItemID: number,
	read numFragmentsCollected: number,
	read numFragmentsRequired: number,
	read maxFragments: number,
}

export type GetArchaeologyRaceInfoByIDResults = {
	read raceName: string,
	read raceTextureID: number,
	read raceItemID: number,
	read numFragmentsCollected: number,
	read numFragmentsRequired: number,
	read maxFragments: number,
}

export type GetArenaOpponentSpecResults = {
	read specID: number,
	read gender: number,
}

export type GetArtifactInfoByRaceResults = {
	read artifactName: string,
	read artifactDescription: string,
	read artifactRarity: number,
	read artifactIcon: string,
	read hoverDescription: string,
	read keystoneCount: number,
	read bgTexture: string,
	read firstCompletionTime: number,
	read completionCount: number,
}

export type GetArtifactProgressResults = {
	read numFragmentsCollected: number,
	read numFragmentsAdded: number,
	read numFragmentsRequired: number,
}

export type GetAutoQuestPopUpResults = {
	read questID: number,
	read type: string,
}

export type GetAvailableQuestInfoResults = {
	read isTrivial: boolean,
	read frequency: number,
	read isRepeatable: boolean,
	read isLegendary: boolean,
	read questID: number,
	read isImportant: boolean,
}

export type GetAverageItemLevelResults = {
	read avgItemLevel: number,
	read avgItemLevelEquipped: number,
	read avgItemLevelPvp: number,
}

export type GetBattlefieldStatusResults = {
	read status: string,
	read mapName: Maybe<string>,
	read teamSize: number,
	read registeredMatch: boolean,
	read suspendedQueue: boolean,
	read queueType: Maybe<string>,
	read gameType: Maybe<string>,
	read role: Maybe<string>,
	read asGroup: Maybe<boolean>,
	read shortDescription: Maybe<string>,
	read longDescription: Maybe<string>,
	read isSoloQueue: boolean,
}

export type GetBattlefieldTeamInfoResults = {
	read teamName: string,
	read oldTeamRating: number,
	read newTeamRating: number,
	read teamRating: number,
}

export type GetBattlegroundPointsResults = {
	read currentPoints: number,
	read maxPoints: number,
}

export type GetBuildInfoResults = {
	read buildVersion: string,
	read buildNumber: string,
	read buildDate: string,
	read interfaceVersion: number,
	read localizedVersion: string,
	read buildInfo: string,
}

export type GetBuybackItemInfoResults = {
	read name: Maybe<string>,
	read icon: Maybe<fileID>,
	read price: number,
	read quantity: number,
	read numAvailable: number,
	read isUsable: boolean,
	read isBound: Maybe<boolean>,
}

export type GetCameraFOVDefaultsResults = {
	read fieldOfViewDegreesDefault: number,
	read fieldOfViewDegreesPlayerMin: number,
	read fieldOfViewDegreesPlayerMax: number,
}

export type GetCategoryInfoResults = {
	read title: string,
	read parentCategoryID: number,
	read flags: number,
}

export type GetCategoryNumAchievementsResults = {
	read total: number,
	read completed: number,
	read incompleted: number,
}

export type GetChannelDisplayInfoResults = {
	read name: string,
	read header: boolean,
	read collapsed: Maybe<boolean>,
	read channelNumber: Maybe<number>,
	read count: Maybe<number>,
	read active: Maybe<boolean>,
	read category: string,
	read channelType: number,
}

export type GetChannelNameResults = {
	read id: number,
	read name: string,
	read instanceID: number,
	read isCommunitiesChannel: boolean,
}

export type GetChatWindowInfoResults = {
	read name: string,
	read fontSize: number,
	read r: number,
	read g: number,
	read b: number,
	read alpha: number,
	read shown: boolean,
	read locked: boolean,
	read docked: number,
	read uninteractable: boolean,
}

export type GetClassColorResults = {
	read r: number,
	read g: number,
	read b: number,
	read colorStr: string,
}

export type GetClassInfoResults = {
	read className: string,
	read classFile: string,
	read classID: number,
}

export type GetCompanionInfoResults = {
	read creatureID: number,
	read creatureName: string,
	read creatureSpellID: number,
	read icon: string,
	read issummoned: boolean,
	read mountType: number,
}

export type GetCursorCenterPositionResults = {
	read posX: number,
	read posY: number,
}

export type GetCursorDeltaResults = {
	read deltaX: number,
	read deltaY: number,
}

export type GetCursorPositionResults = {
	read posX: number,
	read posY: number,
}

export type GetDefaultLanguageResults = {
	read language: string,
	read languageID: number,
}

export type GetDifficultyInfoResults = {
	read name: string,
	read instanceType: string,
	read isHeroic: boolean,
	read isChallengeMode: boolean,
	read displayHeroic: boolean,
	read displayMythic: boolean,
	read toggleDifficultyID: Maybe<number>,
	read isLFR: boolean,
	read minPlayers: Maybe<number>,
	read maxPlayers: Maybe<number>,
	read isUserSelectable: boolean,
}

export type GetEventCPUUsageResults = {
	read call_time: number,
	read call_count: number,
}

export type GetEventTimeResults = {
	read totalElapsedTime: number,
	read numExecutedHandlers: number,
	read slowestHandlerName: string,
	read slowestHandlerTime: number,
}

export type GetExpansionTrialInfoResults = {
	read isExpansionTrialAccount: boolean,
	read expansionTrialRemainingSeconds: Maybe<time_t>,
}

export type GetExpertiseResults = {
	read mainhandExpertise: number,
	read offhandExpertise: number,
	read rangedExpertise: number,
}

export type GetExpertisePercentResults = {
	read mainhandExpertisePercent: number,
	read offhandExpertisePercent: number,
	read rangedExpertisePercent: number,
}

export type GetFlyoutInfoResults = {
	read name: string,
	read description: string,
	read numSlots: number,
	read isKnown: boolean,
}

export type GetFlyoutSlotInfoResults = {
	read flyoutSpellID: number,
	read overrideSpellID: number,
	read isKnown: boolean,
	read spellName: string,
	read slotSpecID: number,
}

export type GetFrameCPUUsageResults = {
	read call_time: number,
	read call_count: number,
}

export type GetFunctionCPUUsageResults = {
	read call_time: number,
	read call_count: number,
}

export type GetGameMessageInfoResults = {
	read errorName: string,
	read soundKitID: Maybe<number>,
	read voiceID: Maybe<number>,
}

export type GetGameTimeResults = {
	read hour: number,
	read minute: number,
}

export type GetGuildBankItemInfoResults = {
	read texture: number,
	read itemCount: number,
	read locked: boolean,
	read isFiltered: boolean,
	read quality: Enum_ItemQuality,
}

export type GetGuildBankMoneyTransactionResults = {
	read transactionType: string,
	read name: string,
	read amount: number,
	read years: number,
	read months: number,
	read days: number,
	read hours: number,
}

export type GetGuildBankTabInfoResults = {
	read name: string,
	read icon: string,
	read isViewable: boolean,
	read canDeposit: boolean,
	read numWithdrawals: number,
	read remainingWithdrawals: number,
	read filtered: boolean,
}

export type GetGuildBankTabPermissionsResults = {
	read canView: boolean,
	read canDeposit: boolean,
	read canEdit: boolean,
	read stacksPerDay: number,
}

export type GetGuildBankTransactionResults = {
	read type: string,
	read name: string,
	read itemLink: string,
	read count: number,
	read tab1: number,
	read tab2: number,
	read year: number,
	read month: number,
	read day: number,
	read hour: number,
}

export type GetGuildInfoResults = {
	read guildName: string,
	read guildRankName: string,
	read guildRankIndex: number,
	read realm: Maybe<string>,
}

export type GetGuildRecipeInfoPostQueryResults = {
	read professionID: number,
	read recipeID: number,
	read numMembers: number,
}

export type GetGuildRecipeMemberResults = {
	read name: string,
	read online: boolean,
}

export type GetGuildRosterInfoResults = {
	read name: string,
	read rankName: string,
	read rankIndex: number,
	read level: number,
	read classDisplayName: string,
	read zone: string,
	read publicNote: string,
	read officerNote: string,
	read isOnline: boolean,
	read status: number,
	read class: string,
	read achievementPoints: number,
	read achievementRank: number,
	read isMobile: boolean,
	read canSoR: boolean,
	read repStanding: number,
	read guid: string,
}

export type GetGuildRosterLastOnlineResults = {
	read yearsOffline: number,
	read monthsOffline: number,
	read daysOffline: number,
	read hoursOffline: number,
}

export type GetGuildTabardFilesResults = {
	read tabardBackgroundUpper: number,
	read tabardBackgroundLower: number,
	read tabardEmblemUpper: number,
	read tabardEmblemLower: number,
	read tabardBorderUpper: number,
	read tabardBorderLower: number,
}

export type GetGuildTradeSkillInfoResults = {
	read skillID: number,
	read isCollapsed: boolean,
	read iconTexture: string,
	read headerName: string,
	read numOnline: number,
	read numVisible: number,
	read numPlayers: number,
	read playerName: string,
	read playerNameWithRealm: string,
	read class: string,
	read online: boolean,
	read zone: string,
	read skill: number,
	read classFileName: string,
	read isMobile: boolean,
	read isAway: number,
}

export type GetHealthRegenResults = {
	read healthRegen: number,
	read combatHealthRegen: number,
}

export type GetHealthRegenFromSpiritResults = {
	read healthRegen: number,
	read combatHealthRegen: number,
}

export type GetInboxHeaderInfoResults = {
	read packageIcon: string,
	read stationeryIcon: string,
	read sender: string,
	read subject: string,
	read money: number,
	read CODAmount: number,
	read daysLeft: number,
	read hasItem: number,
	read wasRead: boolean,
	read wasReturned: boolean,
	read textCreated: boolean,
	read canReply: boolean,
	read isGM: boolean,
}

export type GetInboxInvoiceInfoResults = {
	read invoiceType: Maybe<string>,
	read itemName: Maybe<string>,
	read playerName: Maybe<string>,
	read bid: number,
	read buyout: number,
	read deposit: number,
	read consignment: number,
	read moneyDelay: number,
	read etaHour: number,
	read etaMin: number,
	read count: number,
	read commerceAuction: boolean,
}

export type GetInboxItemResults = {
	read name: string,
	read itemID: number,
	read texture: string,
	read count: number,
	read quality: Enum_ItemQuality,
	read canUse: boolean,
}

export type GetInboxNumItemsResults = {
	read numItems: number,
	read totalItems: number,
}

export type GetInboxTextResults = {
	read bodyText: string,
	read stationaryMiddle: string,
	read stationaryEdge: string,
	read isTakeable: boolean,
	read isInvoice: boolean,
	read isConsortium: boolean,
}

export type GetInspectArenaDataResults = {
	read rating: number,
	read seasonPlayed: number,
	read seasonWon: number,
	read weeklyPlayed: number,
	read weeklyWon: number,
}

export type GetInspectHonorDataResults = {
	read todayHK: number,
	read todayHonor: number,
	read yesterdayHK: number,
	read yesterdayHonor: number,
	read lifetimeHK: number,
	read lifetimeRank: number,
}

export type GetInstanceInfoResults = {
	read name: string,
	read instanceType: string,
	read difficultyID: number,
	read difficultyName: string,
	read maxPlayers: number,
	read dynamicDifficulty: number,
	read isDynamic: Maybe<boolean>,
	read instanceID: number,
	read instanceGroupSize: number,
	read lfgDungeonID: Maybe<number>,
	read hasWorldTier: boolean,
}

export type GetInstanceLockTimeRemainingResults = {
	read timeLeft: number,
	read extending: boolean,
	read encountersTotal: number,
	read encountersCompleted: number,
}

export type GetInstanceLockTimeRemainingEncounterResults = {
	read encounterName: string,
	read texture: string,
	read isKilled: boolean,
	read ineligible: boolean,
}

export type GetInventoryItemCooldownResults = {
	read start: number,
	read duration: number,
	read enable: number,
}

export type GetInventoryItemDurabilityResults = {
	read current: number,
	read maximum: number,
}

export type GetInventoryItemIDResults = {
	read itemId: number,
	read unknown: number,
}

export type GetInviteConfirmationInfoResults = {
	read confirmationType: number,
	read name: string,
	read guid: string,
	read rolesInvalid: boolean,
	read willConvertToRaid: boolean,
	read level: number,
	read spec: number,
	read itemLevel: number,
}

export type GetItemLevelColorResults = {
	read r: number,
	read g: number,
	read b: number,
}

export type GetLFGBootProposalResults = {
	read inProgress: boolean,
	read didVote: boolean,
	read myVote: boolean,
	read targetName: string,
	read totalVotes: number,
	read bootVotes: number,
	read timeLeft: number,
	read reason: string,
}

export type GetLFGDungeonEncounterInfoResults = {
	read bossName: string,
	read texture: string,
	read isKilled: boolean,
	read unknown4: boolean,
}

export type GetLFGDungeonInfoResults = {
	read name: string,
	read typeID: number,
	read subtypeID: number,
	read minLevel: number,
	read maxLevel: number,
	read recLevel: number,
	read minRecLevel: number,
	read maxRecLevel: number,
	read expansionLevel: number,
	read groupID: number,
	read textureFilename: string,
	read difficulty: number,
	read maxPlayers: number,
	read description: string,
	read isHoliday: boolean,
	read bonusRepAmount: number,
	read minPlayers: number,
	read isTimeWalker: boolean,
	read name2: string,
	read minGearLevel: number,
	read isScalingDungeon: boolean,
	read lfgMapID: number,
}

export type GetLFGDungeonNumEncountersResults = {
	read numEncounters: number,
	read numCompleted: number,
}

export type GetLFGDungeonRewardCapBarInfoResults = {
	read currencyID: number,
	read dungeonID: number,
	read quantity: number,
	read limit: number,
	read overallQuantity: number,
	read overallLimit: number,
	read periodPurseQuantity: number,
	read periodPurseLimit: number,
	read purseQuantity: number,
	read purseLimit: number,
}

export type GetLFGProposalResults = {
	read proposalExists: boolean,
	read id: number,
	read typeID: number,
	read subtypeID: number,
	read name: string,
	read texture: string,
	read role: string,
	read hasResponded: boolean,
	read totalEncounters: number,
	read completedEncounters: number,
	read numMembers: number,
	read isLeader: boolean,
	read isHoliday: boolean,
	read proposalCategory: number,
}

export type GetLFGQueueStatsResults = {
	read hasData: boolean,
	read leaderNeeds: boolean,
	read tankNeeds: boolean,
	read healerNeeds: boolean,
	read dpsNeeds: boolean,
	read totalTanks: number,
	read totalHealers: number,
	read totalDPS: number,
	read instanceType: number,
	read instanceSubType: number,
	read instanceName: string,
	read averageWait: number,
	read tankWait: number,
	read healerWait: number,
	read dpsWait: number,
	read myWait: number,
	read queuedTime: number,
	read activeID: number,
}

export type GetLFGRandomDungeonInfoResults = {
	read id: number,
	read name: string,
	read typeID: number,
	read subtypeID: number,
	read minLevel: number,
	read maxLevel: number,
	read recLevel: number,
	read minRecLevel: number,
	read maxRecLevel: number,
	read expansionLevel: number,
	read groupID: number,
	read textureFilename: string,
	read difficultyID: number,
	read maxPlayers: number,
	read description: string,
	read isHoliday: boolean,
	read bonusRepAmount: number,
	read minPlayers: number,
	read isTimeWalker: boolean,
	read name2: string,
	read minGearLevel: number,
	read isScalingDungeon: boolean,
}

export type GetLFGRoleShortageRewardsResults = {
	read eligible: boolean,
	read forTank: boolean,
	read forHealer: boolean,
	read forDamage: boolean,
	read itemCount: number,
	read money: number,
	read xp: number,
}

export type GetLFGRoleUpdateSlotResults = {
	read dungeonID: number,
	read dungeonType: number,
	read dungeonSubType: number,
}

export type GetLFGRolesResults = {
	read isLeader: boolean,
	read isTank: boolean,
	read isHealer: boolean,
	read isDPS: boolean,
}

export type GetLanguageByIndexResults = {
	read language: string,
	read languageID: number,
}

export type GetLatestThreeSendersResults = {
	read sender1: Maybe<string>,
	read sender2: Maybe<string>,
	read sender3: Maybe<string>,
}

export type GetLocalGameTimeResults = {
	read hour: number,
	read minute: number,
}

export type GetLootRollItemInfoResults = {
	read texture: string,
	read name: string,
	read count: number,
	read quality: Enum_ItemQuality,
	read bindOnPickUp: boolean,
	read canNeed: boolean,
	read canGreed: boolean,
	read canDisenchant: boolean,
	read reasonNeed: number,
	read reasonGreed: number,
	read reasonDisenchant: number,
	read deSkillRequired: number,
	read canTransmog: boolean,
}

export type GetLootSlotInfoResults = {
	read lootIcon: string,
	read lootName: string,
	read lootQuantity: number,
	read currencyID: number,
	read lootQuality: Enum_ItemQuality,
	read locked: boolean,
	read isQuestItem: boolean,
	read questID: number,
	read isActive: boolean,
	read isCoin: boolean,
}

export type GetLootSourceInfoResults = {
	read guid: string,
	read quantity: number,
}

export type GetMacroInfoResults = {
	read name: string,
	read icon: fileID,
	read body: string,
}

export type GetMacroItemResults = {
	read itemName: string,
	read itemLink: string,
}

export type GetManaRegenResults = {
	read baseManaRegen: number,
	read castingManaRegen: number,
}

export type GetManaRegenFromSpiritResults = {
	read powerRegen: number,
	read combatPowerRegen: number,
}

export type GetMasteryEffectResults = {
	read masteryEffect: number,
	read bonusCoefficient: number,
}

export type GetMerchantItemCostItemResults = {
	read itemTexture: string,
	read itemValue: number,
	read itemLink: string,
	read currencyName: string,
}

export type GetMirrorTimerInfoResults = {
	read name: string,
	read startValue: number,
	read maxValue: number,
	read scale: number,
	read paused: number,
	read label: string,
	read spellID: number,
}

export type GetMovieDownloadProgressResults = {
	read inProgress: boolean,
	read downloaded: BigUInteger,
	read total: BigUInteger,
}

export type GetMultiCastTotemSpellsResults = {
	read totem1: number,
	read totem2: number,
	read totem3: number,
	read totem4: number,
	read totem5: number,
	read totem6: number,
	read totem7: number,
}

export type GetNextAchievementResults = {
	read nextID: Maybe<number>,
	read completed: Maybe<boolean>,
}

export type GetNumComparisonCompletedAchievementsResults = {
	read total: number,
	read completed: number,
}

export type GetNumCompletedAchievementsResults = {
	read total: number,
	read completed: number,
}

export type GetNumGuildMembersResults = {
	read numTotal: number,
	read numOnline: number,
}

export type GetNumMacrosResults = {
	read global: number,
	read perChar: number,
}

export type GetPVPLifetimeStatsResults = {
	read lifetimeHonorableKills: number,
	read lifetimeMaxPVPRank: Enum_PvPRanks,
}

export type GetPVPRolesResults = {
	read tank: boolean,
	read healer: boolean,
	read dps: boolean,
}

export type GetPVPSessionStatsResults = {
	read honorableKills: number,
	read dishonorableKills: number,
}

export type GetPVPYesterdayStatsResults = {
	read honorableKills: number,
	read dishonorableKills: number,
}

export type GetPersonalRatedInfoResults = {
	read rating: number,
	read seasonBest: number,
	read weeklyBest: number,
	read seasonPlayed: number,
	read seasonWon: number,
	read weeklyPlayed: number,
	read weeklyWon: number,
	read cap: number,
}

export type GetPetActionCooldownResults = {
	read startTime: number,
	read duration: number,
	read enable: number,
}

export type GetPetActionInfoResults = {
	read name: string,
	read texture: string,
	read isToken: boolean,
	read isActive: boolean,
	read autoCastAllowed: boolean,
	read autoCastEnabled: boolean,
	read spellID: number,
	read checksRange: boolean,
	read inRange: boolean,
}

export type GetPetCritChanceResults = {
	read meleeCrit: number,
	read spellCrit: number,
}

export type GetPetExperienceResults = {
	read currXP: number,
	read nextXP: number,
}

export type GetPetitionInfoResults = {
	read petitionType: string,
	read title: string,
	read bodyText: string,
	read maxSigs: number,
	read originator: string,
	read isOriginator: boolean,
	read minSigs: number,
}

export type GetPhysicalScreenSizeResults = {
	read sizeX: number,
	read sizeY: number,
}

export type GetPlayerInfoByGUIDResults = {
	read localizedClass: string,
	read englishClass: string,
	read localizedRace: string,
	read englishRace: string,
	read sex: number,
	read name: string,
	read realmName: string,
	read level: Maybe<number>,
}

export type GetPossessInfoResults = {
	read texture: string,
	read spellID: number,
	read enabled: boolean,
}

export type GetPowerRegenResults = {
	read basePowerRegen: number,
	read castingPowerRegen: number,
}

export type GetPowerRegenForPowerTypeResults = {
	read basePowerRegen: number,
	read castingPowerRegen: number,
}

export type GetProfessionInfoResults = {
	read name: string,
	read icon: fileID,
	read skillLevel: number,
	read maxSkillLevel: number,
	read numAbilities: number,
	read spelloffset: number,
	read skillLine: number,
	read skillModifier: number,
	read specializationIndex: number,
	read specializationOffset: number,
	read skillLineName: string,
}

export type GetProfessionsResults = {
	read prof1: number,
	read prof2: number,
	read archaeology: number,
	read fishing: number,
	read cooking: number,
}

export type GetPvpTalentInfoByIDResults = {
	read talentID: number,
	read name: string,
	read icon: number,
	read selected: boolean,
	read available: boolean,
	read spellID: number,
	read unlocked: boolean,
	read row: number,
	read column: number,
	read known: boolean,
	read grantedByAura: boolean,
}

export type GetQuestItemInfoResults = {
	read name: string,
	read texture: number,
	read count: number,
	read quality: Enum_ItemQuality,
	read isUsable: boolean,
	read itemID: number,
}

export type GetQuestLogChoiceInfoResults = {
	read itemName: string,
	read itemTexture: fileID,
	read quantity: number,
	read quality: Enum_ItemQuality,
	read isUsable: boolean,
	read itemID: number,
}

export type GetQuestLogLeaderBoardResults = {
	read description: string,
	read objectiveType: string,
	read isCompleted: boolean,
}

export type GetQuestLogQuestTextResults = {
	read questDescription: string,
	read questObjectives: string,
}

export type GetQuestLogRewardInfoResults = {
	read itemName: string,
	read itemTexture: string,
	read numItems: number,
	read quality: Enum_ItemQuality,
	read isUsable: boolean,
	read itemID: number,
	read itemLevel: number,
}

export type GetQuestLogSpecialItemCooldownResults = {
	read start: number,
	read duration: number,
	read enable: number,
}

export type GetQuestLogSpecialItemInfoResults = {
	read link: Maybe<string>,
	read item: number,
	read charges: number,
	read showItemWhenComplete: boolean,
}

export type GetQuestObjectiveInfoResults = {
	read text: string,
	read objectiveType: string,
	read finished: boolean,
	read fulfilled: number,
	read required: number,
}

export type GetRFDungeonInfoResults = {
	read id: number,
	read name: string,
	read typeID: number,
	read subtypeID: number,
	read minLevel: number,
	read maxLevel: number,
	read recLevel: number,
	read minRecLevel: number,
	read maxRecLevel: number,
	read expansionLevel: number,
	read groupID: number,
	read textureFilename: string,
	read difficulty: number,
	read maxPlayers: number,
	read description: string,
	read isHoliday: boolean,
	read bonusRepAmount: number,
	read minPlayers: number,
	read isTimeWalking: boolean,
	read name2: string,
	read minGearLevel: number,
	read isScaling: boolean,
	read lfgMapID: number,
}

export type GetRaidRosterInfoResults = {
	read name: string,
	read rank: number,
	read subgroup: number,
	read level: number,
	read class: string,
	read fileName: string,
	read zone: Maybe<string>,
	read online: boolean,
	read isDead: boolean,
	read role: string,
	read isML: boolean,
	read combatRole: string,
}

export type GetRangedHasteResults = {
	read result: number,
	read quiverHaste: number,
}

export type GetRepairAllCostResults = {
	read repairAllCost: number,
	read canRepair: Maybe<boolean>,
}

export type GetRestStateResults = {
	read exhaustionID: number,
	read name: string,
	read factor: number,
}

export type GetRestrictedAccountDataResults = {
	read maxLevel: number,
	read maxMoney: WOWMONEY,
	read professionCap: number,
}

export type GetRuneCooldownResults = {
	read startTime: number,
	read duration: number,
	read isRuneReady: boolean,
}

export type GetSavedInstanceEncounterInfoResults = {
	read bossName: string,
	read fileDataID: number,
	read isKilled: boolean,
	read unknown4: boolean,
}

export type GetSavedInstanceInfoResults = {
	read name: string,
	read lockoutId: number,
	read reset: number,
	read difficultyId: number,
	read locked: boolean,
	read extended: boolean,
	read instanceIDMostSig: number,
	read isRaid: boolean,
	read maxPlayers: number,
	read difficultyName: string,
	read numEncounters: number,
	read encounterProgress: number,
	read extendDisabled: boolean,
	read instanceId: number,
}

export type GetSavedWorldBossInfoResults = {
	read name: string,
	read worldBossID: number,
	read reset: number,
}

export type GetSelectedArtifactInfoResults = {
	read artifactName: string,
	read artifactDescription: string,
	read artifactRarity: number,
	read artifactIcon: number,
	read hoverDescription: string,
	read keystoneCount: number,
	read bgTexture: number,
	read spellID: number,
}

export type GetSendMailItemResults = {
	read name: string,
	read itemID: number,
	read texture: fileID,
	read count: number,
	read quality: Enum_ItemQuality,
}

export type GetShapeshiftFormCooldownResults = {
	read startTime: number,
	read duration: number,
	read isActive: number,
}

export type GetShapeshiftFormInfoResults = {
	read icon: string,
	read active: boolean,
	read castable: boolean,
	read spellID: number,
}

export type GetSpecializationInfoByIDResults = {
	read id: number,
	read name: string,
	read description: string,
	read icon: number,
	read role: string,
	read classFile: string,
	read className: string,
}

export type GetSpecializationInfoForClassIDResults = {
	read id: number,
	read name: string,
	read description: string,
	read icon: fileID,
	read role: string,
	read recommended: boolean,
	read allowedForBoost: boolean,
	read masterySpell1: Maybe<number>,
	read masterySpell2: Maybe<number>,
}

export type GetSpecializationInfoForSpecIDResults = {
	read id: number,
	read name: string,
	read description: string,
	read icon: fileID,
	read role: string,
	read recommended: boolean,
	read allowedForBoost: boolean,
	read masterySpell1: Maybe<number>,
	read masterySpell2: Maybe<number>,
}

export type GetSpellBaseCooldownResults = {
	read cooldownMS: number,
	read gcdMS: number,
}

export type GetStatisticResults = {
	read value: string,
	read skip: boolean,
	read id: string,
}

export type GetTalentTierInfoResults = {
	read tierAvailable: boolean,
	read selectedTalent: number,
	read tierUnlockLevel: number,
}

export type GetTaskInfoResults = {
	read isInArea: boolean,
	read isOnMap: boolean,
	read numObjectives: number,
}

export type GetTexCoordsByGridResults = {
	read minX: number,
	read maxX: number,
	read minY: number,
	read maxY: number,
}

export type GetTexCoordsForRoleResults = {
	read minX: number,
	read maxX: number,
	read minY: number,
	read maxY: number,
}

export type GetTextureInfoResults = {
	read assetName: string,
	read assetType: string,
	read ulX: number,
	read ulY: number,
	read blX: number,
	read blY: number,
	read urX: number,
	read urY: number,
	read brX: number,
	read brY: number,
}

export type GetThreatStatusColorResults = {
	read colorR: number,
	read colorG: number,
	read colorB: number,
}

export type GetTitleNameResults = {
	read titleString: string,
	read playerTitle: boolean,
}

export type GetTotemInfoResults = {
	read haveTotem: boolean,
	read totemName: string,
	read startTime: number,
	read duration: number,
	read icon: fileID,
	read modRate: number,
	read spellID: number,
}

export type GetTradePlayerItemInfoResults = {
	read name: string,
	read texture: number,
	read numItems: number,
	read quality: Enum_ItemQuality,
	read enchantment: string,
	read canLoseTransmog: boolean,
}

export type GetTradeTargetItemInfoResults = {
	read name: string,
	read texture: string,
	read quantity: number,
	read quality: Enum_ItemQuality,
	read isUsable: number,
	read enchant: string,
}

export type GetTrainerServiceAbilityReqResults = {
	read ability: string,
	read hasReq: boolean,
}

export type GetTrainerServiceCostResults = {
	read serviceCost: number,
	read talentCost: number,
	read professionCost: number,
}

export type GetTrainerServiceInfoResults = {
	read name: string,
	read rank: string,
	read category: string,
	read expanded: number,
}

export type GetTrainerServiceSkillReqResults = {
	read skillName: Maybe<string>,
	read skillLevel: number,
	read hasReq: boolean,
}

export type GetUICameraInfoResults = {
	read posX: number,
	read posY: number,
	read posZ: number,
	read lookAtX: number,
	read lookAtY: number,
	read lookAtZ: number,
	read animID: number,
	read animVariation: number,
	read animFrame: number,
	read useModelCenter: boolean,
}

export type GetUnitPowerBarStringsResults = {
	read name: Maybe<string>,
	read tooltip: Maybe<string>,
	read cost: Maybe<string>,
}

export type GetUnitPowerBarStringsByIDResults = {
	read name: Maybe<string>,
	read tooltip: Maybe<string>,
	read cost: Maybe<string>,
}

export type GetUnitPowerBarTextureInfoResults = {
	read texture: fileID,
	read colorR: number,
	read colorG: number,
	read colorB: number,
	read colorA: number,
}

export type GetUnitPowerBarTextureInfoByIDResults = {
	read texture: fileID,
	read colorR: number,
	read colorG: number,
	read colorB: number,
	read colorA: number,
}

export type GetUnitSpeedResults = {
	read currentSpeed: number,
	read runSpeed: number,
	read flightSpeed: number,
	read swimSpeed: number,
}

export type GetVehicleUIIndicatorResults = {
	read backgroundTextureID: fileID,
	read numSeatIndicators: number,
}

export type GetVehicleUIIndicatorSeatResults = {
	read virtualSeatIndex: number,
	read xPos: number,
	read yPos: number,
}

export type GetWorldElapsedTimeResults = {
	read description: string,
	read elapsedTime: number,
	read type: number,
}

export type GetWorldPVPQueueStatusResults = {
	read status: string,
	read mapName: Maybe<string>,
	read queueID: number,
	read expireTime: number,
	read averageWaitTime: number,
	read queuedTime: number,
	read suspended: boolean,
}

export type HasNoReleaseAuraResults = {
	read hasCannotReleaseEffect: boolean,
	read longestDuration: number,
	read hasUntilCancelledDuration: boolean,
}

export type HasPetUIResults = {
	read hasUI: boolean,
	read isHunterPet: boolean,
}

export type InGuildPartyResults = {
	read inGroup: boolean,
	read numGuildPresent: number,
	read numGuildRequired: number,
	read xpMultiplier: number,
}

export type IsActiveBattlefieldArenaResults = {
	read isArena: boolean,
	read isRegistered: boolean,
}

export type IsInInstanceResults = {
	read isInInstance: boolean,
	read instanceType: string,
}

export type IsLFGDungeonJoinableResults = {
	read isAvailableForAll: boolean,
	read isAvailableForPlayer: boolean,
	read hideIfNotJoinable: boolean,
	read totalGroupSizeRequired: number,
}

export type JoinChannelByNameResults = {
	read type: number,
	read name: Maybe<string>,
}

export type JoinPermanentChannelResults = {
	read type: number,
	read name: string,
}

export type JoinTemporaryChannelResults = {
	read type: number,
	read name: string,
}

export type PlaySoundResults = {
	read willPlay: boolean,
	read soundHandle: number,
}

export type PlaySoundFileResults = {
	read willPlay: boolean,
	read soundHandle: number,
}

export type PlayerEffectiveAttackPowerResults = {
	read mainHandAttackPower: number,
	read offHandAttackPower: number,
	read rangedAttackPower: number,
	read baseAttackPower: number,
	read baseRangedAttackPower: number,
}

export type SearchLFGGetNumResultsResults = {
	read numResults: number,
	read totalResults: number,
}

export type SecondsToTimeAbbrevResults = {
	read format: string,
	read time: number,
}

export type SecureCmdOptionParseResults = {
	read result: string,
	read target: string,
}

export type SplitTextIntoHeaderAndNonHeaderResults = {
	read header: Maybe<string>,
	read nonHeader: Maybe<string>,
}

export type TaxiNodePositionResults = {
	read x: number,
	read y: number,
}

export type UnitAlliedRaceInfoResults = {
	read isAlliedRace: boolean,
	read hasHeritageArmorUnlocked: boolean,
}

export type UnitArmorResults = {
	read base: number,
	read effective: number,
	read real: number,
	read bonus: number,
}

export type UnitAttackPowerResults = {
	read attackPower: number,
	read posBuff: number,
	read negBuff: number,
}

export type UnitAttackSpeedResults = {
	read attackSpeed: number,
	read offhandAttackSpeed: Maybe<number>,
	read rangedAttackSpeed: Maybe<number>,
}

export type UnitCastingInfoResults = {
	read name: string,
	read displayName: string,
	read textureID: fileID,
	read startTimeMs: number,
	read endTimeMs: number,
	read isTradeskill: boolean,
	read castID: WOWGUID,
	read notInterruptible: Maybe<boolean>,
	read castingSpellID: number,
	read castBarID: Maybe<number>,
	read delayTimeMs: number,
}

export type UnitChannelInfoResults = {
	read name: string,
	read displayName: string,
	read textureID: fileID,
	read startTimeMs: number,
	read endTimeMs: number,
	read isTradeskill: boolean,
	read notInterruptible: Maybe<boolean>,
	read spellID: number,
	read isEmpowered: boolean,
	read numEmpowerStages: number,
	read castBarID: Maybe<number>,
}

export type UnitClassResults = {
	read className: string,
	read classFilename: string,
	read classID: number,
}

export type UnitClassBaseResults = {
	read classFilename: string,
	read classID: number,
}

export type UnitClassFromGUIDResults = {
	read className: string,
	read classFilename: string,
	read classID: number,
}

export type UnitCreatureFamilyResults = {
	read name: string,
	read id: number,
}

export type UnitCreatureTypeResults = {
	read name: string,
	read id: number,
}

export type UnitDamageResults = {
	read minDamage: number,
	read maxDamage: number,
	read offhandMinDamage: number,
	read offhandMaxDamage: number,
	read posBuff: number,
	read negBuff: number,
	read percent: number,
}

export type UnitDefenseSkillResults = {
	read base: number,
	read modifier: number,
}

export type UnitDetailedThreatSituationResults = {
	read isTanking: boolean,
	read status: number,
	read scaledPercentage: number,
	read rawPercentage: number,
	read rawThreat: number,
}

export type UnitDistanceSquaredResults = {
	read distance: number,
	read checkedDistance: boolean,
}

export type UnitFactionGroupResults = {
	read factionGroupTag: string,
	read localized: string,
}

export type UnitFullNameResults = {
	read unitName: string,
	read unitServer: string,
}

export type UnitGetAvailableRolesResults = {
	read tank: boolean,
	read healer: boolean,
	read dps: boolean,
}

export type UnitInRangeResults = {
	read inRange: boolean,
	read checkedRange: boolean,
}

export type UnitNameResults = {
	read unitName: string,
	read unitServer: string,
}

export type UnitNameFromGUIDResults = {
	read unitName: string,
	read unitServer: string,
}

export type UnitNameUnmodifiedResults = {
	read unitName: string,
	read unitServer: string,
}

export type UnitPositionResults = {
	read positionX: number,
	read positionY: number,
	read positionZ: number,
	read mapID: number,
}

export type UnitPowerBarTimerInfoResults = {
	read duration: number,
	read expiration: number,
	read barID: number,
	read auraID: number,
}

export type UnitPowerTypeResults = {
	read powerType: Enum_PowerType,
	read powerTypeToken: string,
	read rgbX: number,
	read rgbY: number,
	read rgbZ: number,
}

export type UnitRaceResults = {
	read localizedRaceName: string,
	read englishRaceName: string,
	read raceID: number,
}

export type UnitRangedAttackPowerResults = {
	read attackPower: number,
	read posBuff: number,
	read negBuff: number,
}

export type UnitRangedDamageResults = {
	read speed: number,
	read minDamage: number,
	read maxDamage: number,
	read posBuff: number,
	read negBuff: number,
	read percent: number,
}

export type UnitResistanceResults = {
	read baseResistance: number,
	read realResistance: number,
	read effectiveResistance: number,
	read bonusResistance: number,
}

export type UnitSelectionColorResults = {
	read resultR: number,
	read resultG: number,
	read resultB: number,
	read resultA: number,
}

export type UnitStatResults = {
	read currentStat: number,
	read effectiveStat: number,
	read statPositiveBuff: number,
	read statNegativeBuff: number,
}

export type UnitTrialBankedLevelsResults = {
	read bankedLevels: number,
	read xpIntoCurrentLevel: number,
	read xpForNextLevel: number,
}

export type UnitVehicleSeatInfoResults = {
	read controlType: string,
	read occupantName: string,
	read serverName: string,
	read ejectable: boolean,
	read canSwitchSeats: boolean,
}

export type UnitWeaponAttackPowerResults = {
	read mainHandWeaponAttackPower: number,
	read offHandWeaponAttackPower: number,
	read rangedWeaponAttackPower: number,
}

export type frexpResults = {
	read m: number,
	read e: number,
}

export type gsubResults = {
	read result1: string,
	read count: number,
}

export type issecurevalueResults = {
	read isSecure: boolean,
	read taint: Maybe<string>,
}

local Wrappers = {}

function Wrappers.BNGetFOFInfo(mutual: boolean, nonMutual: boolean, index: number): BNGetFOFInfoResults
	local r1, r2, r3 = BNGetFOFInfo(mutual, nonMutual, index)
	return {
		friendID = r1,
		accountName = r2,
		isMutual = r3,
	}
end

function Wrappers.BNGetFOFInfoInto(
	reuse: BNGetFOFInfoResults,
	mutual: boolean,
	nonMutual: boolean,
	index: number
): BNGetFOFInfoResults
	local r1, r2, r3 = BNGetFOFInfo(mutual, nonMutual, index)
	local fields = Reuse.fields(reuse)
	fields.friendID = r1
	fields.accountName = r2
	fields.isMutual = r3
	return reuse
end

function Wrappers.BNGetInfo(): BNGetInfoResults
	local r1, r2, r3, r4, r5, r6, r7 = BNGetInfo()
	return {
		presenceID = Maybe.of(r1),
		battleTag = r2,
		toonID = r3,
		currentBroadcast = r4,
		bnetAFK = r5,
		bnetDND = r6,
		isRIDEnabled = r7,
	}
end

function Wrappers.BNGetInfoInto(reuse: BNGetInfoResults): BNGetInfoResults
	local r1, r2, r3, r4, r5, r6, r7 = BNGetInfo()
	local fields = Reuse.fields(reuse)
	fields.presenceID = Reuse.maybe(fields.presenceID, r1)
	fields.battleTag = r2
	fields.toonID = r3
	fields.currentBroadcast = r4
	fields.bnetAFK = r5
	fields.bnetDND = r6
	fields.isRIDEnabled = r7
	return reuse
end

function Wrappers.BNGetNumFriends(): BNGetNumFriendsResults
	local r1, r2, r3, r4 = BNGetNumFriends()
	return {
		numBNetTotal = r1,
		numBNetOnline = r2,
		numBNetFavorite = r3,
		numBNetFavoriteOnline = r4,
	}
end

function Wrappers.BNGetNumFriendsInto(reuse: BNGetNumFriendsResults): BNGetNumFriendsResults
	local r1, r2, r3, r4 = BNGetNumFriends()
	local fields = Reuse.fields(reuse)
	fields.numBNetTotal = r1
	fields.numBNetOnline = r2
	fields.numBNetFavorite = r3
	fields.numBNetFavoriteOnline = r4
	return reuse
end

function Wrappers.CanChangePlayerDifficulty(): Maybe<CanChangePlayerDifficultyResults>
	local r1, r2 = CanChangePlayerDifficulty()
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		canChange = r1,
		notOnCooldown = r2,
	})
end

function Wrappers.CanChangePlayerDifficultyInto(
	reuse: CanChangePlayerDifficultyResults
): Maybe<CanChangePlayerDifficultyResults>
	local r1, r2 = CanChangePlayerDifficulty()
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.canChange = r1
	fields.notOnCooldown = r2
	return Reuse.just(reuse)
end

function Wrappers.CanComplainInboxItem(mailID: number): Maybe<boolean>
	return Maybe.of(CanComplainInboxItem(mailID))
end

function Wrappers.CanComplainInboxItemInto(reuse: Maybe<boolean>, mailID: number): Maybe<boolean>
	return Reuse.maybe(reuse, CanComplainInboxItem(mailID))
end

function Wrappers.CanLootUnit(targetUnit: WOWGUID): Maybe<CanLootUnitResults>
	local r1, r2 = CanLootUnit(targetUnit)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		hasLoot = r1,
		canLoot = r2,
	})
end

function Wrappers.CanLootUnitInto(reuse: CanLootUnitResults, targetUnit: WOWGUID): Maybe<CanLootUnitResults>
	local r1, r2 = CanLootUnit(targetUnit)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.hasLoot = r1
	fields.canLoot = r2
	return Reuse.just(reuse)
end

function Wrappers.ClosestGameObjectPosition(gameObjectID: number): Maybe<ClosestGameObjectPositionResults>
	local r1, r2, r3 = ClosestGameObjectPosition(gameObjectID)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		xPos = r1,
		yPos = r2,
		distance = r3,
	})
end

function Wrappers.ClosestGameObjectPositionInto(
	reuse: ClosestGameObjectPositionResults,
	gameObjectID: number
): Maybe<ClosestGameObjectPositionResults>
	local r1, r2, r3 = ClosestGameObjectPosition(gameObjectID)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.xPos = r1
	fields.yPos = r2
	fields.distance = r3
	return Reuse.just(reuse)
end

function Wrappers.ClosestUnitPosition(creatureID: number): Maybe<ClosestUnitPositionResults>
	local r1, r2, r3 = ClosestUnitPosition(creatureID)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		xPos = r1,
		yPos = r2,
		distance = r3,
	})
end

function Wrappers.ClosestUnitPositionInto(
	reuse: ClosestUnitPositionResults,
	creatureID: number
): Maybe<ClosestUnitPositionResults>
	local r1, r2, r3 = ClosestUnitPosition(creatureID)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.xPos = r1
	fields.yPos = r2
	fields.distance = r3
	return Reuse.just(reuse)
end

function Wrappers.CopyToClipboard(text: string, removeMarkup: boolean?): Maybe<number>
	return Maybe.of(CopyToClipboard(text, removeMarkup))
end

function Wrappers.CopyToClipboardInto(reuse: Maybe<number>, text: string, removeMarkup: boolean?): Maybe<number>
	return Reuse.maybe(reuse, CopyToClipboard(text, removeMarkup))
end

function Wrappers.CreateWindow(popupStyle: boolean?, topMost: boolean?): Maybe<Frame>
	return Maybe.of(CreateWindow(popupStyle, topMost))
end

function Wrappers.CreateWindowInto(reuse: Maybe<Frame>, popupStyle: boolean?, topMost: boolean?): Maybe<Frame>
	return Reuse.maybe(reuse, CreateWindow(popupStyle, topMost))
end

function Wrappers.EJ_GetCreatureInfo(index: number, encounterID: number?): EJ_GetCreatureInfoResults
	local r1, r2, r3, r4, r5, r6 = EJ_GetCreatureInfo(index, encounterID)
	return {
		id = r1,
		name = r2,
		description = r3,
		displayInfo = r4,
		iconImage = r5,
		uiModelSceneID = r6,
	}
end

function Wrappers.EJ_GetCreatureInfoInto(
	reuse: EJ_GetCreatureInfoResults,
	index: number,
	encounterID: number?
): EJ_GetCreatureInfoResults
	local r1, r2, r3, r4, r5, r6 = EJ_GetCreatureInfo(index, encounterID)
	local fields = Reuse.fields(reuse)
	fields.id = r1
	fields.name = r2
	fields.description = r3
	fields.displayInfo = r4
	fields.iconImage = r5
	fields.uiModelSceneID = r6
	return reuse
end

function Wrappers.EJ_GetEncounterInfo(journalEncounterID: number): EJ_GetEncounterInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8 = EJ_GetEncounterInfo(journalEncounterID)
	return {
		name = r1,
		description = r2,
		journalEncounterID = r3,
		rootSectionID = r4,
		link = r5,
		journalInstanceID = r6,
		dungeonEncounterID = r7,
		instanceID = r8,
	}
end

function Wrappers.EJ_GetEncounterInfoInto(
	reuse: EJ_GetEncounterInfoResults,
	journalEncounterID: number
): EJ_GetEncounterInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8 = EJ_GetEncounterInfo(journalEncounterID)
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.description = r2
	fields.journalEncounterID = r3
	fields.rootSectionID = r4
	fields.link = r5
	fields.journalInstanceID = r6
	fields.dungeonEncounterID = r7
	fields.instanceID = r8
	return reuse
end

function Wrappers.EJ_GetEncounterInfoByIndex(
	index: number,
	journalInstanceID: number?
): EJ_GetEncounterInfoByIndexResults
	local r1, r2, r3, r4, r5, r6, r7, r8 = EJ_GetEncounterInfoByIndex(index, journalInstanceID)
	return {
		name = r1,
		description = r2,
		journalEncounterID = r3,
		rootSectionID = r4,
		link = r5,
		journalInstanceID = r6,
		dungeonEncounterID = r7,
		instanceID = r8,
	}
end

function Wrappers.EJ_GetEncounterInfoByIndexInto(
	reuse: EJ_GetEncounterInfoByIndexResults,
	index: number,
	journalInstanceID: number?
): EJ_GetEncounterInfoByIndexResults
	local r1, r2, r3, r4, r5, r6, r7, r8 = EJ_GetEncounterInfoByIndex(index, journalInstanceID)
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.description = r2
	fields.journalEncounterID = r3
	fields.rootSectionID = r4
	fields.link = r5
	fields.journalInstanceID = r6
	fields.dungeonEncounterID = r7
	fields.instanceID = r8
	return reuse
end

function Wrappers.EJ_GetInstanceByIndex(index: number, isRaid: boolean): EJ_GetInstanceByIndexResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13 = EJ_GetInstanceByIndex(index, isRaid)
	return {
		instanceID = r1,
		name = r2,
		description = r3,
		bgImage = r4,
		buttonImage1 = r5,
		loreImage = r6,
		buttonImage2 = r7,
		dungeonAreaMapID = r8,
		link = r9,
		shouldDisplayDifficulty = r10,
		mapID = r11,
		covenantID = r12,
		isRaid = r13,
	}
end

function Wrappers.EJ_GetInstanceByIndexInto(
	reuse: EJ_GetInstanceByIndexResults,
	index: number,
	isRaid: boolean
): EJ_GetInstanceByIndexResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13 = EJ_GetInstanceByIndex(index, isRaid)
	local fields = Reuse.fields(reuse)
	fields.instanceID = r1
	fields.name = r2
	fields.description = r3
	fields.bgImage = r4
	fields.buttonImage1 = r5
	fields.loreImage = r6
	fields.buttonImage2 = r7
	fields.dungeonAreaMapID = r8
	fields.link = r9
	fields.shouldDisplayDifficulty = r10
	fields.mapID = r11
	fields.covenantID = r12
	fields.isRaid = r13
	return reuse
end

function Wrappers.EJ_GetInstanceInfo(journalInstanceID: number?): EJ_GetInstanceInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12 = EJ_GetInstanceInfo(journalInstanceID)
	return {
		name = r1,
		description = r2,
		bgImage = r3,
		buttonImage1 = r4,
		loreImage = r5,
		buttonImage2 = r6,
		dungeonAreaMapID = r7,
		link = r8,
		shouldDisplayDifficulty = r9,
		mapID = r10,
		covenantID = r11,
		isRaid = r12,
	}
end

function Wrappers.EJ_GetInstanceInfoInto(
	reuse: EJ_GetInstanceInfoResults,
	journalInstanceID: number?
): EJ_GetInstanceInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12 = EJ_GetInstanceInfo(journalInstanceID)
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.description = r2
	fields.bgImage = r3
	fields.buttonImage1 = r4
	fields.loreImage = r5
	fields.buttonImage2 = r6
	fields.dungeonAreaMapID = r7
	fields.link = r8
	fields.shouldDisplayDifficulty = r9
	fields.mapID = r10
	fields.covenantID = r11
	fields.isRaid = r12
	return reuse
end

function Wrappers.EJ_GetLootFilter(): EJ_GetLootFilterResults
	local r1, r2 = EJ_GetLootFilter()
	return {
		classID = r1,
		specID = r2,
	}
end

function Wrappers.EJ_GetLootFilterInto(reuse: EJ_GetLootFilterResults): EJ_GetLootFilterResults
	local r1, r2 = EJ_GetLootFilter()
	local fields = Reuse.fields(reuse)
	fields.classID = r1
	fields.specID = r2
	return reuse
end

function Wrappers.EJ_GetMapEncounter(uiMapID: number, index: number, fromJournal: boolean?): EJ_GetMapEncounterResults
	local r1, r2, r3, r4, r5, r6, r7, r8 = EJ_GetMapEncounter(uiMapID, index, fromJournal)
	return {
		x = r1,
		y = r2,
		instanceID = r3,
		name = r4,
		description = r5,
		encounterID = r6,
		rootSectionID = r7,
		link = r8,
	}
end

function Wrappers.EJ_GetMapEncounterInto(
	reuse: EJ_GetMapEncounterResults,
	uiMapID: number,
	index: number,
	fromJournal: boolean?
): EJ_GetMapEncounterResults
	local r1, r2, r3, r4, r5, r6, r7, r8 = EJ_GetMapEncounter(uiMapID, index, fromJournal)
	local fields = Reuse.fields(reuse)
	fields.x = r1
	fields.y = r2
	fields.instanceID = r3
	fields.name = r4
	fields.description = r5
	fields.encounterID = r6
	fields.rootSectionID = r7
	fields.link = r8
	return reuse
end

function Wrappers.EJ_GetSearchResult(index: number): EJ_GetSearchResultResults
	local r1, r2, r3, r4, r5, r6 = EJ_GetSearchResult(index)
	return {
		id = r1,
		stype = r2,
		difficultyID = r3,
		instanceID = r4,
		encounterID = r5,
		itemLink = r6,
	}
end

function Wrappers.EJ_GetSearchResultInto(reuse: EJ_GetSearchResultResults, index: number): EJ_GetSearchResultResults
	local r1, r2, r3, r4, r5, r6 = EJ_GetSearchResult(index)
	local fields = Reuse.fields(reuse)
	fields.id = r1
	fields.stype = r2
	fields.difficultyID = r3
	fields.instanceID = r4
	fields.encounterID = r5
	fields.itemLink = r6
	return reuse
end

function Wrappers.EJ_GetSectionPath(sectionID: number): EJ_GetSectionPathResults
	local r1, r2, r3, r4 = EJ_GetSectionPath(sectionID)
	return {
		sectionID = r1,
		parent1SectionID = Maybe.of(r2),
		parent2SectionID = Maybe.of(r3),
		rootSectionID = Maybe.of(r4),
	}
end

function Wrappers.EJ_GetSectionPathInto(reuse: EJ_GetSectionPathResults, sectionID: number): EJ_GetSectionPathResults
	local r1, r2, r3, r4 = EJ_GetSectionPath(sectionID)
	local fields = Reuse.fields(reuse)
	fields.sectionID = r1
	fields.parent1SectionID = Reuse.maybe(fields.parent1SectionID, r2)
	fields.parent2SectionID = Reuse.maybe(fields.parent2SectionID, r3)
	fields.rootSectionID = Reuse.maybe(fields.rootSectionID, r4)
	return reuse
end

function Wrappers.EJ_GetTierInfo(index: number): EJ_GetTierInfoResults
	local r1, r2 = EJ_GetTierInfo(index)
	return {
		name = r1,
		link = r2,
	}
end

function Wrappers.EJ_GetTierInfoInto(reuse: EJ_GetTierInfoResults, index: number): EJ_GetTierInfoResults
	local r1, r2 = EJ_GetTierInfo(index)
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.link = r2
	return reuse
end

function Wrappers.EJ_HandleLinkPath(journalType: number, id: number): EJ_HandleLinkPathResults
	local r1, r2, r3, r4 = EJ_HandleLinkPath(journalType, id)
	return {
		instanceID = r1,
		encounterID = Maybe.of(r2),
		sectionID = Maybe.of(r3),
		tierIndex = Maybe.of(r4),
	}
end

function Wrappers.EJ_HandleLinkPathInto(
	reuse: EJ_HandleLinkPathResults,
	journalType: number,
	id: number
): EJ_HandleLinkPathResults
	local r1, r2, r3, r4 = EJ_HandleLinkPath(journalType, id)
	local fields = Reuse.fields(reuse)
	fields.instanceID = r1
	fields.encounterID = Reuse.maybe(fields.encounterID, r2)
	fields.sectionID = Reuse.maybe(fields.sectionID, r3)
	fields.tierIndex = Reuse.maybe(fields.tierIndex, r4)
	return reuse
end

function Wrappers.EnumerateFrames(currentFrame: Frame?): Maybe<Frame>
	return Maybe.of(EnumerateFrames(currentFrame))
end

function Wrappers.EnumerateFramesInto(reuse: Maybe<Frame>, currentFrame: Frame?): Maybe<Frame>
	return Reuse.maybe(reuse, EnumerateFrames(currentFrame))
end

function Wrappers.FindInTableIf(tbl: { [any]: any }, pred: (...any) -> ...any): FindInTableIfResults
	local r1, r2 = FindInTableIf(tbl, pred)
	return {
		key = r1,
		value = r2,
	}
end

function Wrappers.FindInTableIfInto(
	reuse: FindInTableIfResults,
	tbl: { [any]: any },
	pred: (...any) -> ...any
): FindInTableIfResults
	local r1, r2 = FindInTableIf(tbl, pred)
	local fields = Reuse.fields(reuse)
	fields.key = r1
	fields.value = r2
	return reuse
end

function Wrappers.GetAchievementComparisonInfo(achievementID: number): GetAchievementComparisonInfoResults
	local r1, r2, r3, r4 = GetAchievementComparisonInfo(achievementID)
	return {
		completed = r1,
		month = r2,
		day = r3,
		year = r4,
	}
end

function Wrappers.GetAchievementComparisonInfoInto(
	reuse: GetAchievementComparisonInfoResults,
	achievementID: number
): GetAchievementComparisonInfoResults
	local r1, r2, r3, r4 = GetAchievementComparisonInfo(achievementID)
	local fields = Reuse.fields(reuse)
	fields.completed = r1
	fields.month = r2
	fields.day = r3
	fields.year = r4
	return reuse
end

function Wrappers.GetAchievementCriteriaInfo(
	achievementID: number,
	criteriaIndex: number,
	countHidden: boolean?
): GetAchievementCriteriaInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13 =
		GetAchievementCriteriaInfo(achievementID, criteriaIndex, countHidden)
	return {
		criteriaString = r1,
		criteriaType = r2,
		completed = r3,
		quantity = r4,
		reqQuantity = r5,
		charName = r6,
		flags = r7,
		assetID = r8,
		quantityString = r9,
		criteriaID = r10,
		eligible = r11,
		duration = r12,
		elapsed = r13,
	}
end

function Wrappers.GetAchievementCriteriaInfoInto(
	reuse: GetAchievementCriteriaInfoResults,
	achievementID: number,
	criteriaIndex: number,
	countHidden: boolean?
): GetAchievementCriteriaInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13 =
		GetAchievementCriteriaInfo(achievementID, criteriaIndex, countHidden)
	local fields = Reuse.fields(reuse)
	fields.criteriaString = r1
	fields.criteriaType = r2
	fields.completed = r3
	fields.quantity = r4
	fields.reqQuantity = r5
	fields.charName = r6
	fields.flags = r7
	fields.assetID = r8
	fields.quantityString = r9
	fields.criteriaID = r10
	fields.eligible = r11
	fields.duration = r12
	fields.elapsed = r13
	return reuse
end

function Wrappers.GetAchievementCriteriaInfoByID(
	achievementID: number,
	criteriaID: number
): GetAchievementCriteriaInfoByIDResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13 =
		GetAchievementCriteriaInfoByID(achievementID, criteriaID)
	return {
		criteriaString = r1,
		criteriaType = r2,
		completed = r3,
		quantity = r4,
		reqQuantity = r5,
		charName = r6,
		flags = r7,
		assetID = r8,
		quantityString = r9,
		criteriaID = r10,
		eligible = r11,
		duration = r12,
		elapsed = r13,
	}
end

function Wrappers.GetAchievementCriteriaInfoByIDInto(
	reuse: GetAchievementCriteriaInfoByIDResults,
	achievementID: number,
	criteriaID: number
): GetAchievementCriteriaInfoByIDResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13 =
		GetAchievementCriteriaInfoByID(achievementID, criteriaID)
	local fields = Reuse.fields(reuse)
	fields.criteriaString = r1
	fields.criteriaType = r2
	fields.completed = r3
	fields.quantity = r4
	fields.reqQuantity = r5
	fields.charName = r6
	fields.flags = r7
	fields.assetID = r8
	fields.quantityString = r9
	fields.criteriaID = r10
	fields.eligible = r11
	fields.duration = r12
	fields.elapsed = r13
	return reuse
end

function Wrappers.GetAchievementGuildRep(id: number): GetAchievementGuildRepResults
	local r1, r2, r3 = GetAchievementGuildRep(id)
	return {
		requiresRep = r1,
		hasRep = r2,
		repLevel = r3,
	}
end

function Wrappers.GetAchievementGuildRepInto(
	reuse: GetAchievementGuildRepResults,
	id: number
): GetAchievementGuildRepResults
	local r1, r2, r3 = GetAchievementGuildRep(id)
	local fields = Reuse.fields(reuse)
	fields.requiresRep = r1
	fields.hasRep = r2
	fields.repLevel = r3
	return reuse
end

function Wrappers.GetActionBarToggles(): GetActionBarTogglesResults
	local r1, r2, r3, r4, r5, r6, r7 = GetActionBarToggles()
	return {
		bar1 = r1,
		bar2 = r2,
		bar3 = r3,
		bar4 = r4,
		bar5 = r5,
		bar6 = r6,
		bar7 = r7,
	}
end

function Wrappers.GetActionBarTogglesInto(reuse: GetActionBarTogglesResults): GetActionBarTogglesResults
	local r1, r2, r3, r4, r5, r6, r7 = GetActionBarToggles()
	local fields = Reuse.fields(reuse)
	fields.bar1 = r1
	fields.bar2 = r2
	fields.bar3 = r3
	fields.bar4 = r4
	fields.bar5 = r5
	fields.bar6 = r6
	fields.bar7 = r7
	return reuse
end

function Wrappers.GetActionInfo(slot: number): GetActionInfoResults
	local r1, r2, r3 = GetActionInfo(slot)
	return {
		actionType = r1,
		id = r2,
		subType = r3,
	}
end

function Wrappers.GetActionInfoInto(reuse: GetActionInfoResults, slot: number): GetActionInfoResults
	local r1, r2, r3 = GetActionInfo(slot)
	local fields = Reuse.fields(reuse)
	fields.actionType = r1
	fields.id = r2
	fields.subType = r3
	return reuse
end

function Wrappers.GetActiveArtifactByRace(branchIndex: number, artifactIndex: number): GetActiveArtifactByRaceResults
	local r1, r2, r3, r4, r5, r6, r7 = GetActiveArtifactByRace(branchIndex, artifactIndex)
	return {
		artifactName = r1,
		artifactDescription = r2,
		artifactRarity = r3,
		artifactIcon = r4,
		hoverDescription = r5,
		keystoneCount = r6,
		bgTexture = r7,
	}
end

function Wrappers.GetActiveArtifactByRaceInto(
	reuse: GetActiveArtifactByRaceResults,
	branchIndex: number,
	artifactIndex: number
): GetActiveArtifactByRaceResults
	local r1, r2, r3, r4, r5, r6, r7 = GetActiveArtifactByRace(branchIndex, artifactIndex)
	local fields = Reuse.fields(reuse)
	fields.artifactName = r1
	fields.artifactDescription = r2
	fields.artifactRarity = r3
	fields.artifactIcon = r4
	fields.hoverDescription = r5
	fields.keystoneCount = r6
	fields.bgTexture = r7
	return reuse
end

function Wrappers.GetArchaeologyRaceInfo(raceIndex: number): GetArchaeologyRaceInfoResults
	local r1, r2, r3, r4, r5, r6 = GetArchaeologyRaceInfo(raceIndex)
	return {
		raceName = r1,
		raceTexture = r2,
		raceItemID = r3,
		numFragmentsCollected = r4,
		numFragmentsRequired = r5,
		maxFragments = r6,
	}
end

function Wrappers.GetArchaeologyRaceInfoInto(
	reuse: GetArchaeologyRaceInfoResults,
	raceIndex: number
): GetArchaeologyRaceInfoResults
	local r1, r2, r3, r4, r5, r6 = GetArchaeologyRaceInfo(raceIndex)
	local fields = Reuse.fields(reuse)
	fields.raceName = r1
	fields.raceTexture = r2
	fields.raceItemID = r3
	fields.numFragmentsCollected = r4
	fields.numFragmentsRequired = r5
	fields.maxFragments = r6
	return reuse
end

function Wrappers.GetArchaeologyRaceInfoByID(branchID: number): GetArchaeologyRaceInfoByIDResults
	local r1, r2, r3, r4, r5, r6 = GetArchaeologyRaceInfoByID(branchID)
	return {
		raceName = r1,
		raceTextureID = r2,
		raceItemID = r3,
		numFragmentsCollected = r4,
		numFragmentsRequired = r5,
		maxFragments = r6,
	}
end

function Wrappers.GetArchaeologyRaceInfoByIDInto(
	reuse: GetArchaeologyRaceInfoByIDResults,
	branchID: number
): GetArchaeologyRaceInfoByIDResults
	local r1, r2, r3, r4, r5, r6 = GetArchaeologyRaceInfoByID(branchID)
	local fields = Reuse.fields(reuse)
	fields.raceName = r1
	fields.raceTextureID = r2
	fields.raceItemID = r3
	fields.numFragmentsCollected = r4
	fields.numFragmentsRequired = r5
	fields.maxFragments = r6
	return reuse
end

function Wrappers.GetArenaOpponentSpec(id: number): GetArenaOpponentSpecResults
	local r1, r2 = GetArenaOpponentSpec(id)
	return {
		specID = r1,
		gender = r2,
	}
end

function Wrappers.GetArenaOpponentSpecInto(reuse: GetArenaOpponentSpecResults, id: number): GetArenaOpponentSpecResults
	local r1, r2 = GetArenaOpponentSpec(id)
	local fields = Reuse.fields(reuse)
	fields.specID = r1
	fields.gender = r2
	return reuse
end

function Wrappers.GetArtifactInfoByRace(raceIndex: number, artifactIndex: number): GetArtifactInfoByRaceResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9 = GetArtifactInfoByRace(raceIndex, artifactIndex)
	return {
		artifactName = r1,
		artifactDescription = r2,
		artifactRarity = r3,
		artifactIcon = r4,
		hoverDescription = r5,
		keystoneCount = r6,
		bgTexture = r7,
		firstCompletionTime = r8,
		completionCount = r9,
	}
end

function Wrappers.GetArtifactInfoByRaceInto(
	reuse: GetArtifactInfoByRaceResults,
	raceIndex: number,
	artifactIndex: number
): GetArtifactInfoByRaceResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9 = GetArtifactInfoByRace(raceIndex, artifactIndex)
	local fields = Reuse.fields(reuse)
	fields.artifactName = r1
	fields.artifactDescription = r2
	fields.artifactRarity = r3
	fields.artifactIcon = r4
	fields.hoverDescription = r5
	fields.keystoneCount = r6
	fields.bgTexture = r7
	fields.firstCompletionTime = r8
	fields.completionCount = r9
	return reuse
end

function Wrappers.GetArtifactProgress(): GetArtifactProgressResults
	local r1, r2, r3 = GetArtifactProgress()
	return {
		numFragmentsCollected = r1,
		numFragmentsAdded = r2,
		numFragmentsRequired = r3,
	}
end

function Wrappers.GetArtifactProgressInto(reuse: GetArtifactProgressResults): GetArtifactProgressResults
	local r1, r2, r3 = GetArtifactProgress()
	local fields = Reuse.fields(reuse)
	fields.numFragmentsCollected = r1
	fields.numFragmentsAdded = r2
	fields.numFragmentsRequired = r3
	return reuse
end

function Wrappers.GetAutoQuestPopUp(index: number): GetAutoQuestPopUpResults
	local r1, r2 = GetAutoQuestPopUp(index)
	return {
		questID = r1,
		type = r2,
	}
end

function Wrappers.GetAutoQuestPopUpInto(reuse: GetAutoQuestPopUpResults, index: number): GetAutoQuestPopUpResults
	local r1, r2 = GetAutoQuestPopUp(index)
	local fields = Reuse.fields(reuse)
	fields.questID = r1
	fields.type = r2
	return reuse
end

function Wrappers.GetAvailableQuestInfo(index: number): GetAvailableQuestInfoResults
	local r1, r2, r3, r4, r5, r6 = GetAvailableQuestInfo(index)
	return {
		isTrivial = r1,
		frequency = r2,
		isRepeatable = r3,
		isLegendary = r4,
		questID = r5,
		isImportant = r6,
	}
end

function Wrappers.GetAvailableQuestInfoInto(
	reuse: GetAvailableQuestInfoResults,
	index: number
): GetAvailableQuestInfoResults
	local r1, r2, r3, r4, r5, r6 = GetAvailableQuestInfo(index)
	local fields = Reuse.fields(reuse)
	fields.isTrivial = r1
	fields.frequency = r2
	fields.isRepeatable = r3
	fields.isLegendary = r4
	fields.questID = r5
	fields.isImportant = r6
	return reuse
end

function Wrappers.GetAverageItemLevel(): GetAverageItemLevelResults
	local r1, r2, r3 = GetAverageItemLevel()
	return {
		avgItemLevel = r1,
		avgItemLevelEquipped = r2,
		avgItemLevelPvp = r3,
	}
end

function Wrappers.GetAverageItemLevelInto(reuse: GetAverageItemLevelResults): GetAverageItemLevelResults
	local r1, r2, r3 = GetAverageItemLevel()
	local fields = Reuse.fields(reuse)
	fields.avgItemLevel = r1
	fields.avgItemLevelEquipped = r2
	fields.avgItemLevelPvp = r3
	return reuse
end

function Wrappers.GetBattlefieldStatus(index: number): GetBattlefieldStatusResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12 = GetBattlefieldStatus(index)
	return {
		status = r1,
		mapName = Maybe.of(r2),
		teamSize = r3,
		registeredMatch = r4,
		suspendedQueue = r5,
		queueType = Maybe.of(r6),
		gameType = Maybe.of(r7),
		role = Maybe.of(r8),
		asGroup = Maybe.of(r9),
		shortDescription = Maybe.of(r10),
		longDescription = Maybe.of(r11),
		isSoloQueue = r12,
	}
end

function Wrappers.GetBattlefieldStatusInto(
	reuse: GetBattlefieldStatusResults,
	index: number
): GetBattlefieldStatusResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12 = GetBattlefieldStatus(index)
	local fields = Reuse.fields(reuse)
	fields.status = r1
	fields.mapName = Reuse.maybe(fields.mapName, r2)
	fields.teamSize = r3
	fields.registeredMatch = r4
	fields.suspendedQueue = r5
	fields.queueType = Reuse.maybe(fields.queueType, r6)
	fields.gameType = Reuse.maybe(fields.gameType, r7)
	fields.role = Reuse.maybe(fields.role, r8)
	fields.asGroup = Reuse.maybe(fields.asGroup, r9)
	fields.shortDescription = Reuse.maybe(fields.shortDescription, r10)
	fields.longDescription = Reuse.maybe(fields.longDescription, r11)
	fields.isSoloQueue = r12
	return reuse
end

function Wrappers.GetBattlefieldTeamInfo(index: number): GetBattlefieldTeamInfoResults
	local r1, r2, r3, r4 = GetBattlefieldTeamInfo(index)
	return {
		teamName = r1,
		oldTeamRating = r2,
		newTeamRating = r3,
		teamRating = r4,
	}
end

function Wrappers.GetBattlefieldTeamInfoInto(
	reuse: GetBattlefieldTeamInfoResults,
	index: number
): GetBattlefieldTeamInfoResults
	local r1, r2, r3, r4 = GetBattlefieldTeamInfo(index)
	local fields = Reuse.fields(reuse)
	fields.teamName = r1
	fields.oldTeamRating = r2
	fields.newTeamRating = r3
	fields.teamRating = r4
	return reuse
end

function Wrappers.GetBattlefieldWinner(): Maybe<number>
	return Maybe.of(GetBattlefieldWinner())
end

function Wrappers.GetBattlefieldWinnerInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, GetBattlefieldWinner())
end

function Wrappers.GetBattlegroundPoints(team: number): GetBattlegroundPointsResults
	local r1, r2 = GetBattlegroundPoints(team)
	return {
		currentPoints = r1,
		maxPoints = r2,
	}
end

function Wrappers.GetBattlegroundPointsInto(
	reuse: GetBattlegroundPointsResults,
	team: number
): GetBattlegroundPointsResults
	local r1, r2 = GetBattlegroundPoints(team)
	local fields = Reuse.fields(reuse)
	fields.currentPoints = r1
	fields.maxPoints = r2
	return reuse
end

function Wrappers.GetBuildInfo(): GetBuildInfoResults
	local r1, r2, r3, r4, r5, r6 = GetBuildInfo()
	return {
		buildVersion = r1,
		buildNumber = r2,
		buildDate = r3,
		interfaceVersion = r4,
		localizedVersion = r5,
		buildInfo = r6,
	}
end

function Wrappers.GetBuildInfoInto(reuse: GetBuildInfoResults): GetBuildInfoResults
	local r1, r2, r3, r4, r5, r6 = GetBuildInfo()
	local fields = Reuse.fields(reuse)
	fields.buildVersion = r1
	fields.buildNumber = r2
	fields.buildDate = r3
	fields.interfaceVersion = r4
	fields.localizedVersion = r5
	fields.buildInfo = r6
	return reuse
end

function Wrappers.GetBuildOption(name: string): Maybe<boolean>
	return Maybe.of(GetBuildOption(name))
end

function Wrappers.GetBuildOptionInto(reuse: Maybe<boolean>, name: string): Maybe<boolean>
	return Reuse.maybe(reuse, GetBuildOption(name))
end

function Wrappers.GetBuybackItemInfo(slotIndex: number): GetBuybackItemInfoResults
	local r1, r2, r3, r4, r5, r6, r7 = GetBuybackItemInfo(slotIndex)
	return {
		name = Maybe.of(r1),
		icon = Maybe.of(r2),
		price = r3,
		quantity = r4,
		numAvailable = r5,
		isUsable = r6,
		isBound = Maybe.of(r7),
	}
end

function Wrappers.GetBuybackItemInfoInto(reuse: GetBuybackItemInfoResults, slotIndex: number): GetBuybackItemInfoResults
	local r1, r2, r3, r4, r5, r6, r7 = GetBuybackItemInfo(slotIndex)
	local fields = Reuse.fields(reuse)
	fields.name = Reuse.maybe(fields.name, r1)
	fields.icon = Reuse.maybe(fields.icon, r2)
	fields.price = r3
	fields.quantity = r4
	fields.numAvailable = r5
	fields.isUsable = r6
	fields.isBound = Reuse.maybe(fields.isBound, r7)
	return reuse
end

function Wrappers.GetCVar(name: CVar): Maybe<string>
	return Maybe.of(GetCVar(name))
end

function Wrappers.GetCVarInto(reuse: Maybe<string>, name: CVar): Maybe<string>
	return Reuse.maybe(reuse, GetCVar(name))
end

function Wrappers.GetCVarBitfield(name: CVar, index: number): Maybe<boolean>
	return Maybe.of(GetCVarBitfield(name, index))
end

function Wrappers.GetCVarBitfieldInto(reuse: Maybe<boolean>, name: CVar, index: number): Maybe<boolean>
	return Reuse.maybe(reuse, GetCVarBitfield(name, index))
end

function Wrappers.GetCVarBool(name: CVar): Maybe<boolean>
	return Maybe.of(GetCVarBool(name))
end

function Wrappers.GetCVarBoolInto(reuse: Maybe<boolean>, name: CVar): Maybe<boolean>
	return Reuse.maybe(reuse, GetCVarBool(name))
end

function Wrappers.GetCVarDefault(name: CVar): Maybe<string>
	return Maybe.of(GetCVarDefault(name))
end

function Wrappers.GetCVarDefaultInto(reuse: Maybe<string>, name: CVar): Maybe<string>
	return Reuse.maybe(reuse, GetCVarDefault(name))
end

function Wrappers.GetCameraFOVDefaults(): GetCameraFOVDefaultsResults
	local r1, r2, r3 = GetCameraFOVDefaults()
	return {
		fieldOfViewDegreesDefault = r1,
		fieldOfViewDegreesPlayerMin = r2,
		fieldOfViewDegreesPlayerMax = r3,
	}
end

function Wrappers.GetCameraFOVDefaultsInto(reuse: GetCameraFOVDefaultsResults): GetCameraFOVDefaultsResults
	local r1, r2, r3 = GetCameraFOVDefaults()
	local fields = Reuse.fields(reuse)
	fields.fieldOfViewDegreesDefault = r1
	fields.fieldOfViewDegreesPlayerMin = r2
	fields.fieldOfViewDegreesPlayerMax = r3
	return reuse
end

function Wrappers.GetCategoryInfo(categoryID: number): GetCategoryInfoResults
	local r1, r2, r3 = GetCategoryInfo(categoryID)
	return {
		title = r1,
		parentCategoryID = r2,
		flags = r3,
	}
end

function Wrappers.GetCategoryInfoInto(reuse: GetCategoryInfoResults, categoryID: number): GetCategoryInfoResults
	local r1, r2, r3 = GetCategoryInfo(categoryID)
	local fields = Reuse.fields(reuse)
	fields.title = r1
	fields.parentCategoryID = r2
	fields.flags = r3
	return reuse
end

function Wrappers.GetCategoryNumAchievements(
	categoryId: number,
	includeAll: boolean?
): GetCategoryNumAchievementsResults
	local r1, r2, r3 = GetCategoryNumAchievements(categoryId, includeAll)
	return {
		total = r1,
		completed = r2,
		incompleted = r3,
	}
end

function Wrappers.GetCategoryNumAchievementsInto(
	reuse: GetCategoryNumAchievementsResults,
	categoryId: number,
	includeAll: boolean?
): GetCategoryNumAchievementsResults
	local r1, r2, r3 = GetCategoryNumAchievements(categoryId, includeAll)
	local fields = Reuse.fields(reuse)
	fields.total = r1
	fields.completed = r2
	fields.incompleted = r3
	return reuse
end

function Wrappers.GetChannelDisplayInfo(index: number): GetChannelDisplayInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8 = GetChannelDisplayInfo(index)
	return {
		name = r1,
		header = r2,
		collapsed = Maybe.of(r3),
		channelNumber = Maybe.of(r4),
		count = Maybe.of(r5),
		active = Maybe.of(r6),
		category = r7,
		channelType = r8,
	}
end

function Wrappers.GetChannelDisplayInfoInto(
	reuse: GetChannelDisplayInfoResults,
	index: number
): GetChannelDisplayInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8 = GetChannelDisplayInfo(index)
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.header = r2
	fields.collapsed = Reuse.maybe(fields.collapsed, r3)
	fields.channelNumber = Reuse.maybe(fields.channelNumber, r4)
	fields.count = Reuse.maybe(fields.count, r5)
	fields.active = Reuse.maybe(fields.active, r6)
	fields.category = r7
	fields.channelType = r8
	return reuse
end

function Wrappers.GetChannelName(name: string | number): GetChannelNameResults
	local r1, r2, r3, r4 = GetChannelName(name)
	return {
		id = r1,
		name = r2,
		instanceID = r3,
		isCommunitiesChannel = r4,
	}
end

function Wrappers.GetChannelNameInto(reuse: GetChannelNameResults, name: string | number): GetChannelNameResults
	local r1, r2, r3, r4 = GetChannelName(name)
	local fields = Reuse.fields(reuse)
	fields.id = r1
	fields.name = r2
	fields.instanceID = r3
	fields.isCommunitiesChannel = r4
	return reuse
end

function Wrappers.GetChatWindowInfo(frameIndex: number): GetChatWindowInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10 = GetChatWindowInfo(frameIndex)
	return {
		name = r1,
		fontSize = r2,
		r = r3,
		g = r4,
		b = r5,
		alpha = r6,
		shown = r7,
		locked = r8,
		docked = r9,
		uninteractable = r10,
	}
end

function Wrappers.GetChatWindowInfoInto(reuse: GetChatWindowInfoResults, frameIndex: number): GetChatWindowInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10 = GetChatWindowInfo(frameIndex)
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.fontSize = r2
	fields.r = r3
	fields.g = r4
	fields.b = r5
	fields.alpha = r6
	fields.shown = r7
	fields.locked = r8
	fields.docked = r9
	fields.uninteractable = r10
	return reuse
end

function Wrappers.GetClassColor(classFilename: ClassFile): GetClassColorResults
	local r1, r2, r3, r4 = GetClassColor(classFilename)
	return {
		r = r1,
		g = r2,
		b = r3,
		colorStr = r4,
	}
end

function Wrappers.GetClassColorInto(reuse: GetClassColorResults, classFilename: ClassFile): GetClassColorResults
	local r1, r2, r3, r4 = GetClassColor(classFilename)
	local fields = Reuse.fields(reuse)
	fields.r = r1
	fields.g = r2
	fields.b = r3
	fields.colorStr = r4
	return reuse
end

function Wrappers.GetClassInfo(classID: number): GetClassInfoResults
	local r1, r2, r3 = GetClassInfo(classID)
	return {
		className = r1,
		classFile = r2,
		classID = r3,
	}
end

function Wrappers.GetClassInfoInto(reuse: GetClassInfoResults, classID: number): GetClassInfoResults
	local r1, r2, r3 = GetClassInfo(classID)
	local fields = Reuse.fields(reuse)
	fields.className = r1
	fields.classFile = r2
	fields.classID = r3
	return reuse
end

function Wrappers.GetClickFrame(name: string): Maybe<{ [any]: any }>
	return Maybe.of(GetClickFrame(name))
end

function Wrappers.GetClickFrameInto(reuse: Maybe<{ [any]: any }>, name: string): Maybe<{ [any]: any }>
	return Reuse.maybe(reuse, GetClickFrame(name))
end

function Wrappers.GetCombatRating(ratingIndex: number): Maybe<number>
	return Maybe.of(GetCombatRating(ratingIndex))
end

function Wrappers.GetCombatRatingInto(reuse: Maybe<number>, ratingIndex: number): Maybe<number>
	return Reuse.maybe(reuse, GetCombatRating(ratingIndex))
end

function Wrappers.GetCombatRatingBonus(ratingIndex: number): Maybe<number>
	return Maybe.of(GetCombatRatingBonus(ratingIndex))
end

function Wrappers.GetCombatRatingBonusInto(reuse: Maybe<number>, ratingIndex: number): Maybe<number>
	return Reuse.maybe(reuse, GetCombatRatingBonus(ratingIndex))
end

function Wrappers.GetCombatRatingBonusForCombatRatingValue(ratingIndex: number, value: number): Maybe<number>
	return Maybe.of(GetCombatRatingBonusForCombatRatingValue(ratingIndex, value))
end

function Wrappers.GetCombatRatingBonusForCombatRatingValueInto(
	reuse: Maybe<number>,
	ratingIndex: number,
	value: number
): Maybe<number>
	return Reuse.maybe(reuse, GetCombatRatingBonusForCombatRatingValue(ratingIndex, value))
end

function Wrappers.GetCompanionInfo(type: string, id: number): GetCompanionInfoResults
	local r1, r2, r3, r4, r5, r6 = GetCompanionInfo(type, id)
	return {
		creatureID = r1,
		creatureName = r2,
		creatureSpellID = r3,
		icon = r4,
		issummoned = r5,
		mountType = r6,
	}
end

function Wrappers.GetCompanionInfoInto(
	reuse: GetCompanionInfoResults,
	type: string,
	id: number
): GetCompanionInfoResults
	local r1, r2, r3, r4, r5, r6 = GetCompanionInfo(type, id)
	local fields = Reuse.fields(reuse)
	fields.creatureID = r1
	fields.creatureName = r2
	fields.creatureSpellID = r3
	fields.icon = r4
	fields.issummoned = r5
	fields.mountType = r6
	return reuse
end

function Wrappers.GetCurrentEventID(): Maybe<number>
	return Maybe.of(GetCurrentEventID())
end

function Wrappers.GetCurrentEventIDInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, GetCurrentEventID())
end

function Wrappers.GetCursorCenterPosition(): GetCursorCenterPositionResults
	local r1, r2 = GetCursorCenterPosition()
	return {
		posX = r1,
		posY = r2,
	}
end

function Wrappers.GetCursorCenterPositionInto(reuse: GetCursorCenterPositionResults): GetCursorCenterPositionResults
	local r1, r2 = GetCursorCenterPosition()
	local fields = Reuse.fields(reuse)
	fields.posX = r1
	fields.posY = r2
	return reuse
end

function Wrappers.GetCursorDelta(): GetCursorDeltaResults
	local r1, r2 = GetCursorDelta()
	return {
		deltaX = r1,
		deltaY = r2,
	}
end

function Wrappers.GetCursorDeltaInto(reuse: GetCursorDeltaResults): GetCursorDeltaResults
	local r1, r2 = GetCursorDelta()
	local fields = Reuse.fields(reuse)
	fields.deltaX = r1
	fields.deltaY = r2
	return reuse
end

function Wrappers.GetCursorPosition(): GetCursorPositionResults
	local r1, r2 = GetCursorPosition()
	return {
		posX = r1,
		posY = r2,
	}
end

function Wrappers.GetCursorPositionInto(reuse: GetCursorPositionResults): GetCursorPositionResults
	local r1, r2 = GetCursorPosition()
	local fields = Reuse.fields(reuse)
	fields.posX = r1
	fields.posY = r2
	return reuse
end

function Wrappers.GetDefaultLanguage(): GetDefaultLanguageResults
	local r1, r2 = GetDefaultLanguage()
	return {
		language = r1,
		languageID = r2,
	}
end

function Wrappers.GetDefaultLanguageInto(reuse: GetDefaultLanguageResults): GetDefaultLanguageResults
	local r1, r2 = GetDefaultLanguage()
	local fields = Reuse.fields(reuse)
	fields.language = r1
	fields.languageID = r2
	return reuse
end

function Wrappers.GetDifficultyInfo(difficultyID: number): GetDifficultyInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11 = GetDifficultyInfo(difficultyID)
	return {
		name = r1,
		instanceType = r2,
		isHeroic = r3,
		isChallengeMode = r4,
		displayHeroic = r5,
		displayMythic = r6,
		toggleDifficultyID = Maybe.of(r7),
		isLFR = r8,
		minPlayers = Maybe.of(r9),
		maxPlayers = Maybe.of(r10),
		isUserSelectable = r11,
	}
end

function Wrappers.GetDifficultyInfoInto(reuse: GetDifficultyInfoResults, difficultyID: number): GetDifficultyInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11 = GetDifficultyInfo(difficultyID)
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.instanceType = r2
	fields.isHeroic = r3
	fields.isChallengeMode = r4
	fields.displayHeroic = r5
	fields.displayMythic = r6
	fields.toggleDifficultyID = Reuse.maybe(fields.toggleDifficultyID, r7)
	fields.isLFR = r8
	fields.minPlayers = Reuse.maybe(fields.minPlayers, r9)
	fields.maxPlayers = Reuse.maybe(fields.maxPlayers, r10)
	fields.isUserSelectable = r11
	return reuse
end

function Wrappers.GetErrorCallstackHeight(): Maybe<number>
	return Maybe.of(GetErrorCallstackHeight())
end

function Wrappers.GetErrorCallstackHeightInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, GetErrorCallstackHeight())
end

function Wrappers.GetEventCPUUsage(): GetEventCPUUsageResults
	local r1, r2 = GetEventCPUUsage()
	return {
		call_time = r1,
		call_count = r2,
	}
end

function Wrappers.GetEventCPUUsageInto(reuse: GetEventCPUUsageResults): GetEventCPUUsageResults
	local r1, r2 = GetEventCPUUsage()
	local fields = Reuse.fields(reuse)
	fields.call_time = r1
	fields.call_count = r2
	return reuse
end

function Wrappers.GetEventTime(eventProfileIndex: number): Maybe<GetEventTimeResults>
	local r1, r2, r3, r4 = GetEventTime(eventProfileIndex)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		totalElapsedTime = r1,
		numExecutedHandlers = r2,
		slowestHandlerName = r3,
		slowestHandlerTime = r4,
	})
end

function Wrappers.GetEventTimeInto(reuse: GetEventTimeResults, eventProfileIndex: number): Maybe<GetEventTimeResults>
	local r1, r2, r3, r4 = GetEventTime(eventProfileIndex)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.totalElapsedTime = r1
	fields.numExecutedHandlers = r2
	fields.slowestHandlerName = r3
	fields.slowestHandlerTime = r4
	return Reuse.just(reuse)
end

function Wrappers.GetExpansionDisplayInfo(
	expansionLevel: number,
	desiredReleaseType: Enum_ReleaseType?
): Maybe<ExpansionDisplayInfo>
	return Maybe.of(GetExpansionDisplayInfo(expansionLevel, desiredReleaseType))
end

function Wrappers.GetExpansionDisplayInfoInto(
	reuse: Maybe<ExpansionDisplayInfo>,
	expansionLevel: number,
	desiredReleaseType: Enum_ReleaseType?
): Maybe<ExpansionDisplayInfo>
	return Reuse.maybe(reuse, GetExpansionDisplayInfo(expansionLevel, desiredReleaseType))
end

function Wrappers.GetExpansionForLevel(playerLevel: number): Maybe<number>
	return Maybe.of(GetExpansionForLevel(playerLevel))
end

function Wrappers.GetExpansionForLevelInto(reuse: Maybe<number>, playerLevel: number): Maybe<number>
	return Reuse.maybe(reuse, GetExpansionForLevel(playerLevel))
end

function Wrappers.GetExpansionTrialInfo(): GetExpansionTrialInfoResults
	local r1, r2 = GetExpansionTrialInfo()
	return {
		isExpansionTrialAccount = r1,
		expansionTrialRemainingSeconds = Maybe.of(r2),
	}
end

function Wrappers.GetExpansionTrialInfoInto(reuse: GetExpansionTrialInfoResults): GetExpansionTrialInfoResults
	local r1, r2 = GetExpansionTrialInfo()
	local fields = Reuse.fields(reuse)
	fields.isExpansionTrialAccount = r1
	fields.expansionTrialRemainingSeconds = Reuse.maybe(fields.expansionTrialRemainingSeconds, r2)
	return reuse
end

function Wrappers.GetExpertise(): GetExpertiseResults
	local r1, r2, r3 = GetExpertise()
	return {
		mainhandExpertise = r1,
		offhandExpertise = r2,
		rangedExpertise = r3,
	}
end

function Wrappers.GetExpertiseInto(reuse: GetExpertiseResults): GetExpertiseResults
	local r1, r2, r3 = GetExpertise()
	local fields = Reuse.fields(reuse)
	fields.mainhandExpertise = r1
	fields.offhandExpertise = r2
	fields.rangedExpertise = r3
	return reuse
end

function Wrappers.GetExpertisePercent(): GetExpertisePercentResults
	local r1, r2, r3 = GetExpertisePercent()
	return {
		mainhandExpertisePercent = r1,
		offhandExpertisePercent = r2,
		rangedExpertisePercent = r3,
	}
end

function Wrappers.GetExpertisePercentInto(reuse: GetExpertisePercentResults): GetExpertisePercentResults
	local r1, r2, r3 = GetExpertisePercent()
	local fields = Reuse.fields(reuse)
	fields.mainhandExpertisePercent = r1
	fields.offhandExpertisePercent = r2
	fields.rangedExpertisePercent = r3
	return reuse
end

function Wrappers.GetFinalAtlasFromTextureKitIfExists(
	texture: string,
	textureKit: string | { [any]: any }
): Maybe<string>
	return Maybe.of(GetFinalAtlasFromTextureKitIfExists(texture, textureKit))
end

function Wrappers.GetFinalAtlasFromTextureKitIfExistsInto(
	reuse: Maybe<string>,
	texture: string,
	textureKit: string | { [any]: any }
): Maybe<string>
	return Reuse.maybe(reuse, GetFinalAtlasFromTextureKitIfExists(texture, textureKit))
end

function Wrappers.GetFlyoutInfo(flyoutID: number): GetFlyoutInfoResults
	local r1, r2, r3, r4 = GetFlyoutInfo(flyoutID)
	return {
		name = r1,
		description = r2,
		numSlots = r3,
		isKnown = r4,
	}
end

function Wrappers.GetFlyoutInfoInto(reuse: GetFlyoutInfoResults, flyoutID: number): GetFlyoutInfoResults
	local r1, r2, r3, r4 = GetFlyoutInfo(flyoutID)
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.description = r2
	fields.numSlots = r3
	fields.isKnown = r4
	return reuse
end

function Wrappers.GetFlyoutSlotInfo(flyoutID: number, slot: number): GetFlyoutSlotInfoResults
	local r1, r2, r3, r4, r5 = GetFlyoutSlotInfo(flyoutID, slot)
	return {
		flyoutSpellID = r1,
		overrideSpellID = r2,
		isKnown = r3,
		spellName = r4,
		slotSpecID = r5,
	}
end

function Wrappers.GetFlyoutSlotInfoInto(
	reuse: GetFlyoutSlotInfoResults,
	flyoutID: number,
	slot: number
): GetFlyoutSlotInfoResults
	local r1, r2, r3, r4, r5 = GetFlyoutSlotInfo(flyoutID, slot)
	local fields = Reuse.fields(reuse)
	fields.flyoutSpellID = r1
	fields.overrideSpellID = r2
	fields.isKnown = r3
	fields.spellName = r4
	fields.slotSpecID = r5
	return reuse
end

function Wrappers.GetFontInfo(fontObject: Font): Maybe<FontScriptInfo>
	return Maybe.of(GetFontInfo(fontObject))
end

function Wrappers.GetFontInfoInto(reuse: Maybe<FontScriptInfo>, fontObject: Font): Maybe<FontScriptInfo>
	return Reuse.maybe(reuse, GetFontInfo(fontObject))
end

function Wrappers.GetFrameCPUUsage(frame: Frame, includeChildren: boolean?): GetFrameCPUUsageResults
	local r1, r2 = GetFrameCPUUsage(frame, includeChildren)
	return {
		call_time = r1,
		call_count = r2,
	}
end

function Wrappers.GetFrameCPUUsageInto(
	reuse: GetFrameCPUUsageResults,
	frame: Frame,
	includeChildren: boolean?
): GetFrameCPUUsageResults
	local r1, r2 = GetFrameCPUUsage(frame, includeChildren)
	local fields = Reuse.fields(reuse)
	fields.call_time = r1
	fields.call_count = r2
	return reuse
end

function Wrappers.GetFunctionCPUUsage(): GetFunctionCPUUsageResults
	local r1, r2 = GetFunctionCPUUsage()
	return {
		call_time = r1,
		call_count = r2,
	}
end

function Wrappers.GetFunctionCPUUsageInto(reuse: GetFunctionCPUUsageResults): GetFunctionCPUUsageResults
	local r1, r2 = GetFunctionCPUUsage()
	local fields = Reuse.fields(reuse)
	fields.call_time = r1
	fields.call_count = r2
	return reuse
end

function Wrappers.GetGameMessageInfo(gameErrorIndex: number): Maybe<GetGameMessageInfoResults>
	local r1, r2, r3 = GetGameMessageInfo(gameErrorIndex)
	if r1 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		errorName = r1,
		soundKitID = Maybe.of(r2),
		voiceID = Maybe.of(r3),
	})
end

function Wrappers.GetGameMessageInfoInto(
	reuse: GetGameMessageInfoResults,
	gameErrorIndex: number
): Maybe<GetGameMessageInfoResults>
	local r1, r2, r3 = GetGameMessageInfo(gameErrorIndex)
	if r1 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.errorName = r1
	fields.soundKitID = Reuse.maybe(fields.soundKitID, r2)
	fields.voiceID = Reuse.maybe(fields.voiceID, r3)
	return Reuse.just(reuse)
end

function Wrappers.GetGameTime(): GetGameTimeResults
	local r1, r2 = GetGameTime()
	return {
		hour = r1,
		minute = r2,
	}
end

function Wrappers.GetGameTimeInto(reuse: GetGameTimeResults): GetGameTimeResults
	local r1, r2 = GetGameTime()
	local fields = Reuse.fields(reuse)
	fields.hour = r1
	fields.minute = r2
	return reuse
end

function Wrappers.GetGuildAchievementMemberInfo(achievementID: number, index: number): Maybe<string>
	return Maybe.of(GetGuildAchievementMemberInfo(achievementID, index))
end

function Wrappers.GetGuildAchievementMemberInfoInto(
	reuse: Maybe<string>,
	achievementID: number,
	index: number
): Maybe<string>
	return Reuse.maybe(reuse, GetGuildAchievementMemberInfo(achievementID, index))
end

function Wrappers.GetGuildBankItemInfo(tab: number, slot: number): GetGuildBankItemInfoResults
	local r1, r2, r3, r4, r5 = GetGuildBankItemInfo(tab, slot)
	return {
		texture = r1,
		itemCount = r2,
		locked = r3,
		isFiltered = r4,
		quality = r5,
	}
end

function Wrappers.GetGuildBankItemInfoInto(
	reuse: GetGuildBankItemInfoResults,
	tab: number,
	slot: number
): GetGuildBankItemInfoResults
	local r1, r2, r3, r4, r5 = GetGuildBankItemInfo(tab, slot)
	local fields = Reuse.fields(reuse)
	fields.texture = r1
	fields.itemCount = r2
	fields.locked = r3
	fields.isFiltered = r4
	fields.quality = r5
	return reuse
end

function Wrappers.GetGuildBankMoneyTransaction(index: number): GetGuildBankMoneyTransactionResults
	local r1, r2, r3, r4, r5, r6, r7 = GetGuildBankMoneyTransaction(index)
	return {
		transactionType = r1,
		name = r2,
		amount = r3,
		years = r4,
		months = r5,
		days = r6,
		hours = r7,
	}
end

function Wrappers.GetGuildBankMoneyTransactionInto(
	reuse: GetGuildBankMoneyTransactionResults,
	index: number
): GetGuildBankMoneyTransactionResults
	local r1, r2, r3, r4, r5, r6, r7 = GetGuildBankMoneyTransaction(index)
	local fields = Reuse.fields(reuse)
	fields.transactionType = r1
	fields.name = r2
	fields.amount = r3
	fields.years = r4
	fields.months = r5
	fields.days = r6
	fields.hours = r7
	return reuse
end

function Wrappers.GetGuildBankTabInfo(tab: number): GetGuildBankTabInfoResults
	local r1, r2, r3, r4, r5, r6, r7 = GetGuildBankTabInfo(tab)
	return {
		name = r1,
		icon = r2,
		isViewable = r3,
		canDeposit = r4,
		numWithdrawals = r5,
		remainingWithdrawals = r6,
		filtered = r7,
	}
end

function Wrappers.GetGuildBankTabInfoInto(reuse: GetGuildBankTabInfoResults, tab: number): GetGuildBankTabInfoResults
	local r1, r2, r3, r4, r5, r6, r7 = GetGuildBankTabInfo(tab)
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.icon = r2
	fields.isViewable = r3
	fields.canDeposit = r4
	fields.numWithdrawals = r5
	fields.remainingWithdrawals = r6
	fields.filtered = r7
	return reuse
end

function Wrappers.GetGuildBankTabPermissions(tab: number): GetGuildBankTabPermissionsResults
	local r1, r2, r3, r4 = GetGuildBankTabPermissions(tab)
	return {
		canView = r1,
		canDeposit = r2,
		canEdit = r3,
		stacksPerDay = r4,
	}
end

function Wrappers.GetGuildBankTabPermissionsInto(
	reuse: GetGuildBankTabPermissionsResults,
	tab: number
): GetGuildBankTabPermissionsResults
	local r1, r2, r3, r4 = GetGuildBankTabPermissions(tab)
	local fields = Reuse.fields(reuse)
	fields.canView = r1
	fields.canDeposit = r2
	fields.canEdit = r3
	fields.stacksPerDay = r4
	return reuse
end

function Wrappers.GetGuildBankTransaction(tab: number, index: number): GetGuildBankTransactionResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10 = GetGuildBankTransaction(tab, index)
	return {
		type = r1,
		name = r2,
		itemLink = r3,
		count = r4,
		tab1 = r5,
		tab2 = r6,
		year = r7,
		month = r8,
		day = r9,
		hour = r10,
	}
end

function Wrappers.GetGuildBankTransactionInto(
	reuse: GetGuildBankTransactionResults,
	tab: number,
	index: number
): GetGuildBankTransactionResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10 = GetGuildBankTransaction(tab, index)
	local fields = Reuse.fields(reuse)
	fields.type = r1
	fields.name = r2
	fields.itemLink = r3
	fields.count = r4
	fields.tab1 = r5
	fields.tab2 = r6
	fields.year = r7
	fields.month = r8
	fields.day = r9
	fields.hour = r10
	return reuse
end

function Wrappers.GetGuildInfo(unit: UnitToken): GetGuildInfoResults
	local r1, r2, r3, r4 = GetGuildInfo(unit)
	return {
		guildName = r1,
		guildRankName = r2,
		guildRankIndex = r3,
		realm = Maybe.of(r4),
	}
end

function Wrappers.GetGuildInfoInto(reuse: GetGuildInfoResults, unit: UnitToken): GetGuildInfoResults
	local r1, r2, r3, r4 = GetGuildInfo(unit)
	local fields = Reuse.fields(reuse)
	fields.guildName = r1
	fields.guildRankName = r2
	fields.guildRankIndex = r3
	fields.realm = Reuse.maybe(fields.realm, r4)
	return reuse
end

function Wrappers.GetGuildRecipeInfoPostQuery(): GetGuildRecipeInfoPostQueryResults
	local r1, r2, r3 = GetGuildRecipeInfoPostQuery()
	return {
		professionID = r1,
		recipeID = r2,
		numMembers = r3,
	}
end

function Wrappers.GetGuildRecipeInfoPostQueryInto(
	reuse: GetGuildRecipeInfoPostQueryResults
): GetGuildRecipeInfoPostQueryResults
	local r1, r2, r3 = GetGuildRecipeInfoPostQuery()
	local fields = Reuse.fields(reuse)
	fields.professionID = r1
	fields.recipeID = r2
	fields.numMembers = r3
	return reuse
end

function Wrappers.GetGuildRecipeMember(index: number): GetGuildRecipeMemberResults
	local r1, r2 = GetGuildRecipeMember(index)
	return {
		name = r1,
		online = r2,
	}
end

function Wrappers.GetGuildRecipeMemberInto(
	reuse: GetGuildRecipeMemberResults,
	index: number
): GetGuildRecipeMemberResults
	local r1, r2 = GetGuildRecipeMember(index)
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.online = r2
	return reuse
end

function Wrappers.GetGuildRosterInfo(index: number): GetGuildRosterInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17 = GetGuildRosterInfo(index)
	return {
		name = r1,
		rankName = r2,
		rankIndex = r3,
		level = r4,
		classDisplayName = r5,
		zone = r6,
		publicNote = r7,
		officerNote = r8,
		isOnline = r9,
		status = r10,
		class = r11,
		achievementPoints = r12,
		achievementRank = r13,
		isMobile = r14,
		canSoR = r15,
		repStanding = r16,
		guid = r17,
	}
end

function Wrappers.GetGuildRosterInfoInto(reuse: GetGuildRosterInfoResults, index: number): GetGuildRosterInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17 = GetGuildRosterInfo(index)
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.rankName = r2
	fields.rankIndex = r3
	fields.level = r4
	fields.classDisplayName = r5
	fields.zone = r6
	fields.publicNote = r7
	fields.officerNote = r8
	fields.isOnline = r9
	fields.status = r10
	fields.class = r11
	fields.achievementPoints = r12
	fields.achievementRank = r13
	fields.isMobile = r14
	fields.canSoR = r15
	fields.repStanding = r16
	fields.guid = r17
	return reuse
end

function Wrappers.GetGuildRosterLastOnline(index: number): GetGuildRosterLastOnlineResults
	local r1, r2, r3, r4 = GetGuildRosterLastOnline(index)
	return {
		yearsOffline = r1,
		monthsOffline = r2,
		daysOffline = r3,
		hoursOffline = r4,
	}
end

function Wrappers.GetGuildRosterLastOnlineInto(
	reuse: GetGuildRosterLastOnlineResults,
	index: number
): GetGuildRosterLastOnlineResults
	local r1, r2, r3, r4 = GetGuildRosterLastOnline(index)
	local fields = Reuse.fields(reuse)
	fields.yearsOffline = r1
	fields.monthsOffline = r2
	fields.daysOffline = r3
	fields.hoursOffline = r4
	return reuse
end

function Wrappers.GetGuildTabardFiles(): GetGuildTabardFilesResults
	local r1, r2, r3, r4, r5, r6 = GetGuildTabardFiles()
	return {
		tabardBackgroundUpper = r1,
		tabardBackgroundLower = r2,
		tabardEmblemUpper = r3,
		tabardEmblemLower = r4,
		tabardBorderUpper = r5,
		tabardBorderLower = r6,
	}
end

function Wrappers.GetGuildTabardFilesInto(reuse: GetGuildTabardFilesResults): GetGuildTabardFilesResults
	local r1, r2, r3, r4, r5, r6 = GetGuildTabardFiles()
	local fields = Reuse.fields(reuse)
	fields.tabardBackgroundUpper = r1
	fields.tabardBackgroundLower = r2
	fields.tabardEmblemUpper = r3
	fields.tabardEmblemLower = r4
	fields.tabardBorderUpper = r5
	fields.tabardBorderLower = r6
	return reuse
end

function Wrappers.GetGuildTradeSkillInfo(index: number): GetGuildTradeSkillInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16 = GetGuildTradeSkillInfo(index)
	return {
		skillID = r1,
		isCollapsed = r2,
		iconTexture = r3,
		headerName = r4,
		numOnline = r5,
		numVisible = r6,
		numPlayers = r7,
		playerName = r8,
		playerNameWithRealm = r9,
		class = r10,
		online = r11,
		zone = r12,
		skill = r13,
		classFileName = r14,
		isMobile = r15,
		isAway = r16,
	}
end

function Wrappers.GetGuildTradeSkillInfoInto(
	reuse: GetGuildTradeSkillInfoResults,
	index: number
): GetGuildTradeSkillInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16 = GetGuildTradeSkillInfo(index)
	local fields = Reuse.fields(reuse)
	fields.skillID = r1
	fields.isCollapsed = r2
	fields.iconTexture = r3
	fields.headerName = r4
	fields.numOnline = r5
	fields.numVisible = r6
	fields.numPlayers = r7
	fields.playerName = r8
	fields.playerNameWithRealm = r9
	fields.class = r10
	fields.online = r11
	fields.zone = r12
	fields.skill = r13
	fields.classFileName = r14
	fields.isMobile = r15
	fields.isAway = r16
	return reuse
end

function Wrappers.GetHealthRegen(): GetHealthRegenResults
	local r1, r2 = GetHealthRegen()
	return {
		healthRegen = r1,
		combatHealthRegen = r2,
	}
end

function Wrappers.GetHealthRegenInto(reuse: GetHealthRegenResults): GetHealthRegenResults
	local r1, r2 = GetHealthRegen()
	local fields = Reuse.fields(reuse)
	fields.healthRegen = r1
	fields.combatHealthRegen = r2
	return reuse
end

function Wrappers.GetHealthRegenFromSpirit(): GetHealthRegenFromSpiritResults
	local r1, r2 = GetHealthRegenFromSpirit()
	return {
		healthRegen = r1,
		combatHealthRegen = r2,
	}
end

function Wrappers.GetHealthRegenFromSpiritInto(reuse: GetHealthRegenFromSpiritResults): GetHealthRegenFromSpiritResults
	local r1, r2 = GetHealthRegenFromSpirit()
	local fields = Reuse.fields(reuse)
	fields.healthRegen = r1
	fields.combatHealthRegen = r2
	return reuse
end

function Wrappers.GetInboxHeaderInfo(index: number): GetInboxHeaderInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13 = GetInboxHeaderInfo(index)
	return {
		packageIcon = r1,
		stationeryIcon = r2,
		sender = r3,
		subject = r4,
		money = r5,
		CODAmount = r6,
		daysLeft = r7,
		hasItem = r8,
		wasRead = r9,
		wasReturned = r10,
		textCreated = r11,
		canReply = r12,
		isGM = r13,
	}
end

function Wrappers.GetInboxHeaderInfoInto(reuse: GetInboxHeaderInfoResults, index: number): GetInboxHeaderInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13 = GetInboxHeaderInfo(index)
	local fields = Reuse.fields(reuse)
	fields.packageIcon = r1
	fields.stationeryIcon = r2
	fields.sender = r3
	fields.subject = r4
	fields.money = r5
	fields.CODAmount = r6
	fields.daysLeft = r7
	fields.hasItem = r8
	fields.wasRead = r9
	fields.wasReturned = r10
	fields.textCreated = r11
	fields.canReply = r12
	fields.isGM = r13
	return reuse
end

function Wrappers.GetInboxInvoiceInfo(index: number): GetInboxInvoiceInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12 = GetInboxInvoiceInfo(index)
	return {
		invoiceType = Maybe.of(r1),
		itemName = Maybe.of(r2),
		playerName = Maybe.of(r3),
		bid = r4,
		buyout = r5,
		deposit = r6,
		consignment = r7,
		moneyDelay = r8,
		etaHour = r9,
		etaMin = r10,
		count = r11,
		commerceAuction = r12,
	}
end

function Wrappers.GetInboxInvoiceInfoInto(reuse: GetInboxInvoiceInfoResults, index: number): GetInboxInvoiceInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12 = GetInboxInvoiceInfo(index)
	local fields = Reuse.fields(reuse)
	fields.invoiceType = Reuse.maybe(fields.invoiceType, r1)
	fields.itemName = Reuse.maybe(fields.itemName, r2)
	fields.playerName = Reuse.maybe(fields.playerName, r3)
	fields.bid = r4
	fields.buyout = r5
	fields.deposit = r6
	fields.consignment = r7
	fields.moneyDelay = r8
	fields.etaHour = r9
	fields.etaMin = r10
	fields.count = r11
	fields.commerceAuction = r12
	return reuse
end

function Wrappers.GetInboxItem(index: number, itemIndex: number): GetInboxItemResults
	local r1, r2, r3, r4, r5, r6 = GetInboxItem(index, itemIndex)
	return {
		name = r1,
		itemID = r2,
		texture = r3,
		count = r4,
		quality = r5,
		canUse = r6,
	}
end

function Wrappers.GetInboxItemInto(reuse: GetInboxItemResults, index: number, itemIndex: number): GetInboxItemResults
	local r1, r2, r3, r4, r5, r6 = GetInboxItem(index, itemIndex)
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.itemID = r2
	fields.texture = r3
	fields.count = r4
	fields.quality = r5
	fields.canUse = r6
	return reuse
end

function Wrappers.GetInboxNumItems(): GetInboxNumItemsResults
	local r1, r2 = GetInboxNumItems()
	return {
		numItems = r1,
		totalItems = r2,
	}
end

function Wrappers.GetInboxNumItemsInto(reuse: GetInboxNumItemsResults): GetInboxNumItemsResults
	local r1, r2 = GetInboxNumItems()
	local fields = Reuse.fields(reuse)
	fields.numItems = r1
	fields.totalItems = r2
	return reuse
end

function Wrappers.GetInboxText(index: number): GetInboxTextResults
	local r1, r2, r3, r4, r5, r6 = GetInboxText(index)
	return {
		bodyText = r1,
		stationaryMiddle = r2,
		stationaryEdge = r3,
		isTakeable = r4,
		isInvoice = r5,
		isConsortium = r6,
	}
end

function Wrappers.GetInboxTextInto(reuse: GetInboxTextResults, index: number): GetInboxTextResults
	local r1, r2, r3, r4, r5, r6 = GetInboxText(index)
	local fields = Reuse.fields(reuse)
	fields.bodyText = r1
	fields.stationaryMiddle = r2
	fields.stationaryEdge = r3
	fields.isTakeable = r4
	fields.isInvoice = r5
	fields.isConsortium = r6
	return reuse
end

function Wrappers.GetInspectArenaData(bracketId: number): GetInspectArenaDataResults
	local r1, r2, r3, r4, r5 = GetInspectArenaData(bracketId)
	return {
		rating = r1,
		seasonPlayed = r2,
		seasonWon = r3,
		weeklyPlayed = r4,
		weeklyWon = r5,
	}
end

function Wrappers.GetInspectArenaDataInto(
	reuse: GetInspectArenaDataResults,
	bracketId: number
): GetInspectArenaDataResults
	local r1, r2, r3, r4, r5 = GetInspectArenaData(bracketId)
	local fields = Reuse.fields(reuse)
	fields.rating = r1
	fields.seasonPlayed = r2
	fields.seasonWon = r3
	fields.weeklyPlayed = r4
	fields.weeklyWon = r5
	return reuse
end

function Wrappers.GetInspectHonorData(): GetInspectHonorDataResults
	local r1, r2, r3, r4, r5, r6 = GetInspectHonorData()
	return {
		todayHK = r1,
		todayHonor = r2,
		yesterdayHK = r3,
		yesterdayHonor = r4,
		lifetimeHK = r5,
		lifetimeRank = r6,
	}
end

function Wrappers.GetInspectHonorDataInto(reuse: GetInspectHonorDataResults): GetInspectHonorDataResults
	local r1, r2, r3, r4, r5, r6 = GetInspectHonorData()
	local fields = Reuse.fields(reuse)
	fields.todayHK = r1
	fields.todayHonor = r2
	fields.yesterdayHK = r3
	fields.yesterdayHonor = r4
	fields.lifetimeHK = r5
	fields.lifetimeRank = r6
	return reuse
end

function Wrappers.GetInstanceInfo(): GetInstanceInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11 = GetInstanceInfo()
	return {
		name = r1,
		instanceType = r2,
		difficultyID = r3,
		difficultyName = r4,
		maxPlayers = r5,
		dynamicDifficulty = r6,
		isDynamic = Maybe.of(r7),
		instanceID = r8,
		instanceGroupSize = r9,
		lfgDungeonID = Maybe.of(r10),
		hasWorldTier = r11,
	}
end

function Wrappers.GetInstanceInfoInto(reuse: GetInstanceInfoResults): GetInstanceInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11 = GetInstanceInfo()
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.instanceType = r2
	fields.difficultyID = r3
	fields.difficultyName = r4
	fields.maxPlayers = r5
	fields.dynamicDifficulty = r6
	fields.isDynamic = Reuse.maybe(fields.isDynamic, r7)
	fields.instanceID = r8
	fields.instanceGroupSize = r9
	fields.lfgDungeonID = Reuse.maybe(fields.lfgDungeonID, r10)
	fields.hasWorldTier = r11
	return reuse
end

function Wrappers.GetInstanceLockTimeRemaining(): GetInstanceLockTimeRemainingResults
	local r1, r2, r3, r4 = GetInstanceLockTimeRemaining()
	return {
		timeLeft = r1,
		extending = r2,
		encountersTotal = r3,
		encountersCompleted = r4,
	}
end

function Wrappers.GetInstanceLockTimeRemainingInto(
	reuse: GetInstanceLockTimeRemainingResults
): GetInstanceLockTimeRemainingResults
	local r1, r2, r3, r4 = GetInstanceLockTimeRemaining()
	local fields = Reuse.fields(reuse)
	fields.timeLeft = r1
	fields.extending = r2
	fields.encountersTotal = r3
	fields.encountersCompleted = r4
	return reuse
end

function Wrappers.GetInstanceLockTimeRemainingEncounter(
	encounterIndex: number
): GetInstanceLockTimeRemainingEncounterResults
	local r1, r2, r3, r4 = GetInstanceLockTimeRemainingEncounter(encounterIndex)
	return {
		encounterName = r1,
		texture = r2,
		isKilled = r3,
		ineligible = r4,
	}
end

function Wrappers.GetInstanceLockTimeRemainingEncounterInto(
	reuse: GetInstanceLockTimeRemainingEncounterResults,
	encounterIndex: number
): GetInstanceLockTimeRemainingEncounterResults
	local r1, r2, r3, r4 = GetInstanceLockTimeRemainingEncounter(encounterIndex)
	local fields = Reuse.fields(reuse)
	fields.encounterName = r1
	fields.texture = r2
	fields.isKilled = r3
	fields.ineligible = r4
	return reuse
end

function Wrappers.GetInventoryItemCooldown(unit: UnitToken, invSlotId: number): GetInventoryItemCooldownResults
	local r1, r2, r3 = GetInventoryItemCooldown(unit, invSlotId)
	return {
		start = r1,
		duration = r2,
		enable = r3,
	}
end

function Wrappers.GetInventoryItemCooldownInto(
	reuse: GetInventoryItemCooldownResults,
	unit: UnitToken,
	invSlotId: number
): GetInventoryItemCooldownResults
	local r1, r2, r3 = GetInventoryItemCooldown(unit, invSlotId)
	local fields = Reuse.fields(reuse)
	fields.start = r1
	fields.duration = r2
	fields.enable = r3
	return reuse
end

function Wrappers.GetInventoryItemDurability(invSlotId: number): GetInventoryItemDurabilityResults
	local r1, r2 = GetInventoryItemDurability(invSlotId)
	return {
		current = r1,
		maximum = r2,
	}
end

function Wrappers.GetInventoryItemDurabilityInto(
	reuse: GetInventoryItemDurabilityResults,
	invSlotId: number
): GetInventoryItemDurabilityResults
	local r1, r2 = GetInventoryItemDurability(invSlotId)
	local fields = Reuse.fields(reuse)
	fields.current = r1
	fields.maximum = r2
	return reuse
end

function Wrappers.GetInventoryItemID(unit: UnitToken, invSlotId: number): GetInventoryItemIDResults
	local r1, r2 = GetInventoryItemID(unit, invSlotId)
	return {
		itemId = r1,
		unknown = r2,
	}
end

function Wrappers.GetInventoryItemIDInto(
	reuse: GetInventoryItemIDResults,
	unit: UnitToken,
	invSlotId: number
): GetInventoryItemIDResults
	local r1, r2 = GetInventoryItemID(unit, invSlotId)
	local fields = Reuse.fields(reuse)
	fields.itemId = r1
	fields.unknown = r2
	return reuse
end

function Wrappers.GetInventoryItemLink(unit: UnitToken, invSlotId: number): Maybe<string>
	return Maybe.of(GetInventoryItemLink(unit, invSlotId))
end

function Wrappers.GetInventoryItemLinkInto(reuse: Maybe<string>, unit: UnitToken, invSlotId: number): Maybe<string>
	return Reuse.maybe(reuse, GetInventoryItemLink(unit, invSlotId))
end

function Wrappers.GetInviteConfirmationInfo(guid: unknown): GetInviteConfirmationInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8 = GetInviteConfirmationInfo(guid)
	return {
		confirmationType = r1,
		name = r2,
		guid = r3,
		rolesInvalid = r4,
		willConvertToRaid = r5,
		level = r6,
		spec = r7,
		itemLevel = r8,
	}
end

function Wrappers.GetInviteConfirmationInfoInto(
	reuse: GetInviteConfirmationInfoResults,
	guid: unknown
): GetInviteConfirmationInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8 = GetInviteConfirmationInfo(guid)
	local fields = Reuse.fields(reuse)
	fields.confirmationType = r1
	fields.name = r2
	fields.guid = r3
	fields.rolesInvalid = r4
	fields.willConvertToRaid = r5
	fields.level = r6
	fields.spec = r7
	fields.itemLevel = r8
	return reuse
end

function Wrappers.GetItemLevelColor(): GetItemLevelColorResults
	local r1, r2, r3 = GetItemLevelColor()
	return {
		r = r1,
		g = r2,
		b = r3,
	}
end

function Wrappers.GetItemLevelColorInto(reuse: GetItemLevelColorResults): GetItemLevelColorResults
	local r1, r2, r3 = GetItemLevelColor()
	local fields = Reuse.fields(reuse)
	fields.r = r1
	fields.g = r2
	fields.b = r3
	return reuse
end

function Wrappers.GetLFGBootProposal(): GetLFGBootProposalResults
	local r1, r2, r3, r4, r5, r6, r7, r8 = GetLFGBootProposal()
	return {
		inProgress = r1,
		didVote = r2,
		myVote = r3,
		targetName = r4,
		totalVotes = r5,
		bootVotes = r6,
		timeLeft = r7,
		reason = r8,
	}
end

function Wrappers.GetLFGBootProposalInto(reuse: GetLFGBootProposalResults): GetLFGBootProposalResults
	local r1, r2, r3, r4, r5, r6, r7, r8 = GetLFGBootProposal()
	local fields = Reuse.fields(reuse)
	fields.inProgress = r1
	fields.didVote = r2
	fields.myVote = r3
	fields.targetName = r4
	fields.totalVotes = r5
	fields.bootVotes = r6
	fields.timeLeft = r7
	fields.reason = r8
	return reuse
end

function Wrappers.GetLFGDeserterExpiration(): Maybe<number>
	return Maybe.of(GetLFGDeserterExpiration())
end

function Wrappers.GetLFGDeserterExpirationInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, GetLFGDeserterExpiration())
end

function Wrappers.GetLFGDungeonEncounterInfo(
	dungeonID: number,
	encounterIndex: number
): GetLFGDungeonEncounterInfoResults
	local r1, r2, r3, r4 = GetLFGDungeonEncounterInfo(dungeonID, encounterIndex)
	return {
		bossName = r1,
		texture = r2,
		isKilled = r3,
		unknown4 = r4,
	}
end

function Wrappers.GetLFGDungeonEncounterInfoInto(
	reuse: GetLFGDungeonEncounterInfoResults,
	dungeonID: number,
	encounterIndex: number
): GetLFGDungeonEncounterInfoResults
	local r1, r2, r3, r4 = GetLFGDungeonEncounterInfo(dungeonID, encounterIndex)
	local fields = Reuse.fields(reuse)
	fields.bossName = r1
	fields.texture = r2
	fields.isKilled = r3
	fields.unknown4 = r4
	return reuse
end

function Wrappers.GetLFGDungeonInfo(dungeonID: number): GetLFGDungeonInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r18, r19, r20, r21, r22 =
		GetLFGDungeonInfo(dungeonID)
	return {
		name = r1,
		typeID = r2,
		subtypeID = r3,
		minLevel = r4,
		maxLevel = r5,
		recLevel = r6,
		minRecLevel = r7,
		maxRecLevel = r8,
		expansionLevel = r9,
		groupID = r10,
		textureFilename = r11,
		difficulty = r12,
		maxPlayers = r13,
		description = r14,
		isHoliday = r15,
		bonusRepAmount = r16,
		minPlayers = r17,
		isTimeWalker = r18,
		name2 = r19,
		minGearLevel = r20,
		isScalingDungeon = r21,
		lfgMapID = r22,
	}
end

function Wrappers.GetLFGDungeonInfoInto(reuse: GetLFGDungeonInfoResults, dungeonID: number): GetLFGDungeonInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r18, r19, r20, r21, r22 =
		GetLFGDungeonInfo(dungeonID)
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.typeID = r2
	fields.subtypeID = r3
	fields.minLevel = r4
	fields.maxLevel = r5
	fields.recLevel = r6
	fields.minRecLevel = r7
	fields.maxRecLevel = r8
	fields.expansionLevel = r9
	fields.groupID = r10
	fields.textureFilename = r11
	fields.difficulty = r12
	fields.maxPlayers = r13
	fields.description = r14
	fields.isHoliday = r15
	fields.bonusRepAmount = r16
	fields.minPlayers = r17
	fields.isTimeWalker = r18
	fields.name2 = r19
	fields.minGearLevel = r20
	fields.isScalingDungeon = r21
	fields.lfgMapID = r22
	return reuse
end

function Wrappers.GetLFGDungeonNumEncounters(dungeonID: number): GetLFGDungeonNumEncountersResults
	local r1, r2 = GetLFGDungeonNumEncounters(dungeonID)
	return {
		numEncounters = r1,
		numCompleted = r2,
	}
end

function Wrappers.GetLFGDungeonNumEncountersInto(
	reuse: GetLFGDungeonNumEncountersResults,
	dungeonID: number
): GetLFGDungeonNumEncountersResults
	local r1, r2 = GetLFGDungeonNumEncounters(dungeonID)
	local fields = Reuse.fields(reuse)
	fields.numEncounters = r1
	fields.numCompleted = r2
	return reuse
end

function Wrappers.GetLFGDungeonRewardCapBarInfo(dungeonID: number): GetLFGDungeonRewardCapBarInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10 = GetLFGDungeonRewardCapBarInfo(dungeonID)
	return {
		currencyID = r1,
		dungeonID = r2,
		quantity = r3,
		limit = r4,
		overallQuantity = r5,
		overallLimit = r6,
		periodPurseQuantity = r7,
		periodPurseLimit = r8,
		purseQuantity = r9,
		purseLimit = r10,
	}
end

function Wrappers.GetLFGDungeonRewardCapBarInfoInto(
	reuse: GetLFGDungeonRewardCapBarInfoResults,
	dungeonID: number
): GetLFGDungeonRewardCapBarInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10 = GetLFGDungeonRewardCapBarInfo(dungeonID)
	local fields = Reuse.fields(reuse)
	fields.currencyID = r1
	fields.dungeonID = r2
	fields.quantity = r3
	fields.limit = r4
	fields.overallQuantity = r5
	fields.overallLimit = r6
	fields.periodPurseQuantity = r7
	fields.periodPurseLimit = r8
	fields.purseQuantity = r9
	fields.purseLimit = r10
	return reuse
end

function Wrappers.GetLFGProposal(): GetLFGProposalResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14 = GetLFGProposal()
	return {
		proposalExists = r1,
		id = r2,
		typeID = r3,
		subtypeID = r4,
		name = r5,
		texture = r6,
		role = r7,
		hasResponded = r8,
		totalEncounters = r9,
		completedEncounters = r10,
		numMembers = r11,
		isLeader = r12,
		isHoliday = r13,
		proposalCategory = r14,
	}
end

function Wrappers.GetLFGProposalInto(reuse: GetLFGProposalResults): GetLFGProposalResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14 = GetLFGProposal()
	local fields = Reuse.fields(reuse)
	fields.proposalExists = r1
	fields.id = r2
	fields.typeID = r3
	fields.subtypeID = r4
	fields.name = r5
	fields.texture = r6
	fields.role = r7
	fields.hasResponded = r8
	fields.totalEncounters = r9
	fields.completedEncounters = r10
	fields.numMembers = r11
	fields.isLeader = r12
	fields.isHoliday = r13
	fields.proposalCategory = r14
	return reuse
end

function Wrappers.GetLFGQueueStats(category: number, activeID: number?): GetLFGQueueStatsResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r18 =
		GetLFGQueueStats(category, activeID)
	return {
		hasData = r1,
		leaderNeeds = r2,
		tankNeeds = r3,
		healerNeeds = r4,
		dpsNeeds = r5,
		totalTanks = r6,
		totalHealers = r7,
		totalDPS = r8,
		instanceType = r9,
		instanceSubType = r10,
		instanceName = r11,
		averageWait = r12,
		tankWait = r13,
		healerWait = r14,
		dpsWait = r15,
		myWait = r16,
		queuedTime = r17,
		activeID = r18,
	}
end

function Wrappers.GetLFGQueueStatsInto(
	reuse: GetLFGQueueStatsResults,
	category: number,
	activeID: number?
): GetLFGQueueStatsResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r18 =
		GetLFGQueueStats(category, activeID)
	local fields = Reuse.fields(reuse)
	fields.hasData = r1
	fields.leaderNeeds = r2
	fields.tankNeeds = r3
	fields.healerNeeds = r4
	fields.dpsNeeds = r5
	fields.totalTanks = r6
	fields.totalHealers = r7
	fields.totalDPS = r8
	fields.instanceType = r9
	fields.instanceSubType = r10
	fields.instanceName = r11
	fields.averageWait = r12
	fields.tankWait = r13
	fields.healerWait = r14
	fields.dpsWait = r15
	fields.myWait = r16
	fields.queuedTime = r17
	fields.activeID = r18
	return reuse
end

function Wrappers.GetLFGRandomCooldownExpiration(): Maybe<number>
	return Maybe.of(GetLFGRandomCooldownExpiration())
end

function Wrappers.GetLFGRandomCooldownExpirationInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, GetLFGRandomCooldownExpiration())
end

function Wrappers.GetLFGRandomDungeonInfo(index: number): GetLFGRandomDungeonInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r18, r19, r20, r21, r22 =
		GetLFGRandomDungeonInfo(index)
	return {
		id = r1,
		name = r2,
		typeID = r3,
		subtypeID = r4,
		minLevel = r5,
		maxLevel = r6,
		recLevel = r7,
		minRecLevel = r8,
		maxRecLevel = r9,
		expansionLevel = r10,
		groupID = r11,
		textureFilename = r12,
		difficultyID = r13,
		maxPlayers = r14,
		description = r15,
		isHoliday = r16,
		bonusRepAmount = r17,
		minPlayers = r18,
		isTimeWalker = r19,
		name2 = r20,
		minGearLevel = r21,
		isScalingDungeon = r22,
	}
end

function Wrappers.GetLFGRandomDungeonInfoInto(
	reuse: GetLFGRandomDungeonInfoResults,
	index: number
): GetLFGRandomDungeonInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r18, r19, r20, r21, r22 =
		GetLFGRandomDungeonInfo(index)
	local fields = Reuse.fields(reuse)
	fields.id = r1
	fields.name = r2
	fields.typeID = r3
	fields.subtypeID = r4
	fields.minLevel = r5
	fields.maxLevel = r6
	fields.recLevel = r7
	fields.minRecLevel = r8
	fields.maxRecLevel = r9
	fields.expansionLevel = r10
	fields.groupID = r11
	fields.textureFilename = r12
	fields.difficultyID = r13
	fields.maxPlayers = r14
	fields.description = r15
	fields.isHoliday = r16
	fields.bonusRepAmount = r17
	fields.minPlayers = r18
	fields.isTimeWalker = r19
	fields.name2 = r20
	fields.minGearLevel = r21
	fields.isScalingDungeon = r22
	return reuse
end

function Wrappers.GetLFGRoleShortageRewards(
	dungeonID: number,
	shortageSeverity: number
): GetLFGRoleShortageRewardsResults
	local r1, r2, r3, r4, r5, r6, r7 = GetLFGRoleShortageRewards(dungeonID, shortageSeverity)
	return {
		eligible = r1,
		forTank = r2,
		forHealer = r3,
		forDamage = r4,
		itemCount = r5,
		money = r6,
		xp = r7,
	}
end

function Wrappers.GetLFGRoleShortageRewardsInto(
	reuse: GetLFGRoleShortageRewardsResults,
	dungeonID: number,
	shortageSeverity: number
): GetLFGRoleShortageRewardsResults
	local r1, r2, r3, r4, r5, r6, r7 = GetLFGRoleShortageRewards(dungeonID, shortageSeverity)
	local fields = Reuse.fields(reuse)
	fields.eligible = r1
	fields.forTank = r2
	fields.forHealer = r3
	fields.forDamage = r4
	fields.itemCount = r5
	fields.money = r6
	fields.xp = r7
	return reuse
end

function Wrappers.GetLFGRoleUpdateSlot(index: number): GetLFGRoleUpdateSlotResults
	local r1, r2, r3 = GetLFGRoleUpdateSlot(index)
	return {
		dungeonID = r1,
		dungeonType = r2,
		dungeonSubType = r3,
	}
end

function Wrappers.GetLFGRoleUpdateSlotInto(
	reuse: GetLFGRoleUpdateSlotResults,
	index: number
): GetLFGRoleUpdateSlotResults
	local r1, r2, r3 = GetLFGRoleUpdateSlot(index)
	local fields = Reuse.fields(reuse)
	fields.dungeonID = r1
	fields.dungeonType = r2
	fields.dungeonSubType = r3
	return reuse
end

function Wrappers.GetLFGRoles(): GetLFGRolesResults
	local r1, r2, r3, r4 = GetLFGRoles()
	return {
		isLeader = r1,
		isTank = r2,
		isHealer = r3,
		isDPS = r4,
	}
end

function Wrappers.GetLFGRolesInto(reuse: GetLFGRolesResults): GetLFGRolesResults
	local r1, r2, r3, r4 = GetLFGRoles()
	local fields = Reuse.fields(reuse)
	fields.isLeader = r1
	fields.isTank = r2
	fields.isHealer = r3
	fields.isDPS = r4
	return reuse
end

function Wrappers.GetLanguageByIndex(index: number): GetLanguageByIndexResults
	local r1, r2 = GetLanguageByIndex(index)
	return {
		language = r1,
		languageID = r2,
	}
end

function Wrappers.GetLanguageByIndexInto(reuse: GetLanguageByIndexResults, index: number): GetLanguageByIndexResults
	local r1, r2 = GetLanguageByIndex(index)
	local fields = Reuse.fields(reuse)
	fields.language = r1
	fields.languageID = r2
	return reuse
end

function Wrappers.GetLatestThreeSenders(): GetLatestThreeSendersResults
	local r1, r2, r3 = GetLatestThreeSenders()
	return {
		sender1 = Maybe.of(r1),
		sender2 = Maybe.of(r2),
		sender3 = Maybe.of(r3),
	}
end

function Wrappers.GetLatestThreeSendersInto(reuse: GetLatestThreeSendersResults): GetLatestThreeSendersResults
	local r1, r2, r3 = GetLatestThreeSenders()
	local fields = Reuse.fields(reuse)
	fields.sender1 = Reuse.maybe(fields.sender1, r1)
	fields.sender2 = Reuse.maybe(fields.sender2, r2)
	fields.sender3 = Reuse.maybe(fields.sender3, r3)
	return reuse
end

function Wrappers.GetLegacyRaidDifficultyID(): Maybe<number>
	return Maybe.of(GetLegacyRaidDifficultyID())
end

function Wrappers.GetLegacyRaidDifficultyIDInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, GetLegacyRaidDifficultyID())
end

function Wrappers.GetLocalGameTime(): GetLocalGameTimeResults
	local r1, r2 = GetLocalGameTime()
	return {
		hour = r1,
		minute = r2,
	}
end

function Wrappers.GetLocalGameTimeInto(reuse: GetLocalGameTimeResults): GetLocalGameTimeResults
	local r1, r2 = GetLocalGameTime()
	local fields = Reuse.fields(reuse)
	fields.hour = r1
	fields.minute = r2
	return reuse
end

function Wrappers.GetLootRollItemInfo(rollID: number): GetLootRollItemInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13 = GetLootRollItemInfo(rollID)
	return {
		texture = r1,
		name = r2,
		count = r3,
		quality = r4,
		bindOnPickUp = r5,
		canNeed = r6,
		canGreed = r7,
		canDisenchant = r8,
		reasonNeed = r9,
		reasonGreed = r10,
		reasonDisenchant = r11,
		deSkillRequired = r12,
		canTransmog = r13,
	}
end

function Wrappers.GetLootRollItemInfoInto(reuse: GetLootRollItemInfoResults, rollID: number): GetLootRollItemInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13 = GetLootRollItemInfo(rollID)
	local fields = Reuse.fields(reuse)
	fields.texture = r1
	fields.name = r2
	fields.count = r3
	fields.quality = r4
	fields.bindOnPickUp = r5
	fields.canNeed = r6
	fields.canGreed = r7
	fields.canDisenchant = r8
	fields.reasonNeed = r9
	fields.reasonGreed = r10
	fields.reasonDisenchant = r11
	fields.deSkillRequired = r12
	fields.canTransmog = r13
	return reuse
end

function Wrappers.GetLootRollTimeLeft(rollID: number): Maybe<number>
	return Maybe.of(GetLootRollTimeLeft(rollID))
end

function Wrappers.GetLootRollTimeLeftInto(reuse: Maybe<number>, rollID: number): Maybe<number>
	return Reuse.maybe(reuse, GetLootRollTimeLeft(rollID))
end

function Wrappers.GetLootSlotInfo(slot: number): GetLootSlotInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10 = GetLootSlotInfo(slot)
	return {
		lootIcon = r1,
		lootName = r2,
		lootQuantity = r3,
		currencyID = r4,
		lootQuality = r5,
		locked = r6,
		isQuestItem = r7,
		questID = r8,
		isActive = r9,
		isCoin = r10,
	}
end

function Wrappers.GetLootSlotInfoInto(reuse: GetLootSlotInfoResults, slot: number): GetLootSlotInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10 = GetLootSlotInfo(slot)
	local fields = Reuse.fields(reuse)
	fields.lootIcon = r1
	fields.lootName = r2
	fields.lootQuantity = r3
	fields.currencyID = r4
	fields.lootQuality = r5
	fields.locked = r6
	fields.isQuestItem = r7
	fields.questID = r8
	fields.isActive = r9
	fields.isCoin = r10
	return reuse
end

function Wrappers.GetLootSourceInfo(lootSlot: number): GetLootSourceInfoResults
	local r1, r2 = GetLootSourceInfo(lootSlot)
	return {
		guid = r1,
		quantity = r2,
	}
end

function Wrappers.GetLootSourceInfoInto(reuse: GetLootSourceInfoResults, lootSlot: number): GetLootSourceInfoResults
	local r1, r2 = GetLootSourceInfo(lootSlot)
	local fields = Reuse.fields(reuse)
	fields.guid = r1
	fields.quantity = r2
	return reuse
end

function Wrappers.GetMacroBody(macro: number | string): Maybe<string>
	return Maybe.of(GetMacroBody(macro))
end

function Wrappers.GetMacroBodyInto(reuse: Maybe<string>, macro: number | string): Maybe<string>
	return Reuse.maybe(reuse, GetMacroBody(macro))
end

function Wrappers.GetMacroInfo(macro: number | string): GetMacroInfoResults
	local r1, r2, r3 = GetMacroInfo(macro)
	return {
		name = r1,
		icon = r2,
		body = r3,
	}
end

function Wrappers.GetMacroInfoInto(reuse: GetMacroInfoResults, macro: number | string): GetMacroInfoResults
	local r1, r2, r3 = GetMacroInfo(macro)
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.icon = r2
	fields.body = r3
	return reuse
end

function Wrappers.GetMacroItem(name: number | string): GetMacroItemResults
	local r1, r2 = GetMacroItem(name)
	return {
		itemName = r1,
		itemLink = r2,
	}
end

function Wrappers.GetMacroItemInto(reuse: GetMacroItemResults, name: number | string): GetMacroItemResults
	local r1, r2 = GetMacroItem(name)
	local fields = Reuse.fields(reuse)
	fields.itemName = r1
	fields.itemLink = r2
	return reuse
end

function Wrappers.GetManaRegen(): GetManaRegenResults
	local r1, r2 = GetManaRegen()
	return {
		baseManaRegen = r1,
		castingManaRegen = r2,
	}
end

function Wrappers.GetManaRegenInto(reuse: GetManaRegenResults): GetManaRegenResults
	local r1, r2 = GetManaRegen()
	local fields = Reuse.fields(reuse)
	fields.baseManaRegen = r1
	fields.castingManaRegen = r2
	return reuse
end

function Wrappers.GetManaRegenFromSpirit(): GetManaRegenFromSpiritResults
	local r1, r2 = GetManaRegenFromSpirit()
	return {
		powerRegen = r1,
		combatPowerRegen = r2,
	}
end

function Wrappers.GetManaRegenFromSpiritInto(reuse: GetManaRegenFromSpiritResults): GetManaRegenFromSpiritResults
	local r1, r2 = GetManaRegenFromSpirit()
	local fields = Reuse.fields(reuse)
	fields.powerRegen = r1
	fields.combatPowerRegen = r2
	return reuse
end

function Wrappers.GetMasteryEffect(): GetMasteryEffectResults
	local r1, r2 = GetMasteryEffect()
	return {
		masteryEffect = r1,
		bonusCoefficient = r2,
	}
end

function Wrappers.GetMasteryEffectInto(reuse: GetMasteryEffectResults): GetMasteryEffectResults
	local r1, r2 = GetMasteryEffect()
	local fields = Reuse.fields(reuse)
	fields.masteryEffect = r1
	fields.bonusCoefficient = r2
	return reuse
end

function Wrappers.GetMerchantItemCostItem(index: number, itemIndex: number): GetMerchantItemCostItemResults
	local r1, r2, r3, r4 = GetMerchantItemCostItem(index, itemIndex)
	return {
		itemTexture = r1,
		itemValue = r2,
		itemLink = r3,
		currencyName = r4,
	}
end

function Wrappers.GetMerchantItemCostItemInto(
	reuse: GetMerchantItemCostItemResults,
	index: number,
	itemIndex: number
): GetMerchantItemCostItemResults
	local r1, r2, r3, r4 = GetMerchantItemCostItem(index, itemIndex)
	local fields = Reuse.fields(reuse)
	fields.itemTexture = r1
	fields.itemValue = r2
	fields.itemLink = r3
	fields.currencyName = r4
	return reuse
end

function Wrappers.GetMerchantItemLink(index: number): Maybe<string>
	return Maybe.of(GetMerchantItemLink(index))
end

function Wrappers.GetMerchantItemLinkInto(reuse: Maybe<string>, index: number): Maybe<string>
	return Reuse.maybe(reuse, GetMerchantItemLink(index))
end

function Wrappers.GetMirrorTimerInfo(timerIndex: number): Maybe<GetMirrorTimerInfoResults>
	local r1, r2, r3, r4, r5, r6, r7 = GetMirrorTimerInfo(timerIndex)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil or r5 == nil or r6 == nil or r7 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		name = r1,
		startValue = r2,
		maxValue = r3,
		scale = r4,
		paused = r5,
		label = r6,
		spellID = r7,
	})
end

function Wrappers.GetMirrorTimerInfoInto(
	reuse: GetMirrorTimerInfoResults,
	timerIndex: number
): Maybe<GetMirrorTimerInfoResults>
	local r1, r2, r3, r4, r5, r6, r7 = GetMirrorTimerInfo(timerIndex)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil or r5 == nil or r6 == nil or r7 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.startValue = r2
	fields.maxValue = r3
	fields.scale = r4
	fields.paused = r5
	fields.label = r6
	fields.spellID = r7
	return Reuse.just(reuse)
end

function Wrappers.GetMirrorTimerProgress(timerName: string): Maybe<number>
	return Maybe.of(GetMirrorTimerProgress(timerName))
end

function Wrappers.GetMirrorTimerProgressInto(reuse: Maybe<number>, timerName: string): Maybe<number>
	return Reuse.maybe(reuse, GetMirrorTimerProgress(timerName))
end

function Wrappers.GetMovieDownloadProgress(movieId: number): GetMovieDownloadProgressResults
	local r1, r2, r3 = GetMovieDownloadProgress(movieId)
	return {
		inProgress = r1,
		downloaded = r2,
		total = r3,
	}
end

function Wrappers.GetMovieDownloadProgressInto(
	reuse: GetMovieDownloadProgressResults,
	movieId: number
): GetMovieDownloadProgressResults
	local r1, r2, r3 = GetMovieDownloadProgress(movieId)
	local fields = Reuse.fields(reuse)
	fields.inProgress = r1
	fields.downloaded = r2
	fields.total = r3
	return reuse
end

function Wrappers.GetMultiCastTotemSpells(slot: number): GetMultiCastTotemSpellsResults
	local r1, r2, r3, r4, r5, r6, r7 = GetMultiCastTotemSpells(slot)
	return {
		totem1 = r1,
		totem2 = r2,
		totem3 = r3,
		totem4 = r4,
		totem5 = r5,
		totem6 = r6,
		totem7 = r7,
	}
end

function Wrappers.GetMultiCastTotemSpellsInto(
	reuse: GetMultiCastTotemSpellsResults,
	slot: number
): GetMultiCastTotemSpellsResults
	local r1, r2, r3, r4, r5, r6, r7 = GetMultiCastTotemSpells(slot)
	local fields = Reuse.fields(reuse)
	fields.totem1 = r1
	fields.totem2 = r2
	fields.totem3 = r3
	fields.totem4 = r4
	fields.totem5 = r5
	fields.totem6 = r6
	fields.totem7 = r7
	return reuse
end

function Wrappers.GetNextAchievement(achievementID: number): GetNextAchievementResults
	local r1, r2 = GetNextAchievement(achievementID)
	return {
		nextID = Maybe.of(r1),
		completed = Maybe.of(r2),
	}
end

function Wrappers.GetNextAchievementInto(
	reuse: GetNextAchievementResults,
	achievementID: number
): GetNextAchievementResults
	local r1, r2 = GetNextAchievement(achievementID)
	local fields = Reuse.fields(reuse)
	fields.nextID = Reuse.maybe(fields.nextID, r1)
	fields.completed = Reuse.maybe(fields.completed, r2)
	return reuse
end

function Wrappers.GetNumComparisonCompletedAchievements(
	achievementID: number
): GetNumComparisonCompletedAchievementsResults
	local r1, r2 = GetNumComparisonCompletedAchievements(achievementID)
	return {
		total = r1,
		completed = r2,
	}
end

function Wrappers.GetNumComparisonCompletedAchievementsInto(
	reuse: GetNumComparisonCompletedAchievementsResults,
	achievementID: number
): GetNumComparisonCompletedAchievementsResults
	local r1, r2 = GetNumComparisonCompletedAchievements(achievementID)
	local fields = Reuse.fields(reuse)
	fields.total = r1
	fields.completed = r2
	return reuse
end

function Wrappers.GetNumCompletedAchievements(): GetNumCompletedAchievementsResults
	local r1, r2 = GetNumCompletedAchievements()
	return {
		total = r1,
		completed = r2,
	}
end

function Wrappers.GetNumCompletedAchievementsInto(
	reuse: GetNumCompletedAchievementsResults
): GetNumCompletedAchievementsResults
	local r1, r2 = GetNumCompletedAchievements()
	local fields = Reuse.fields(reuse)
	fields.total = r1
	fields.completed = r2
	return reuse
end

function Wrappers.GetNumGuildMembers(): GetNumGuildMembersResults
	local r1, r2 = GetNumGuildMembers()
	return {
		numTotal = r1,
		numOnline = r2,
	}
end

function Wrappers.GetNumGuildMembersInto(reuse: GetNumGuildMembersResults): GetNumGuildMembersResults
	local r1, r2 = GetNumGuildMembers()
	local fields = Reuse.fields(reuse)
	fields.numTotal = r1
	fields.numOnline = r2
	return reuse
end

function Wrappers.GetNumMacros(): GetNumMacrosResults
	local r1, r2 = GetNumMacros()
	return {
		global = r1,
		perChar = r2,
	}
end

function Wrappers.GetNumMacrosInto(reuse: GetNumMacrosResults): GetNumMacrosResults
	local r1, r2 = GetNumMacros()
	local fields = Reuse.fields(reuse)
	fields.global = r1
	fields.perChar = r2
	return reuse
end

function Wrappers.GetPVPLifetimeStats(): GetPVPLifetimeStatsResults
	local r1, r2 = GetPVPLifetimeStats()
	return {
		lifetimeHonorableKills = r1,
		lifetimeMaxPVPRank = r2,
	}
end

function Wrappers.GetPVPLifetimeStatsInto(reuse: GetPVPLifetimeStatsResults): GetPVPLifetimeStatsResults
	local r1, r2 = GetPVPLifetimeStats()
	local fields = Reuse.fields(reuse)
	fields.lifetimeHonorableKills = r1
	fields.lifetimeMaxPVPRank = r2
	return reuse
end

function Wrappers.GetPVPRoles(): GetPVPRolesResults
	local r1, r2, r3 = GetPVPRoles()
	return {
		tank = r1,
		healer = r2,
		dps = r3,
	}
end

function Wrappers.GetPVPRolesInto(reuse: GetPVPRolesResults): GetPVPRolesResults
	local r1, r2, r3 = GetPVPRoles()
	local fields = Reuse.fields(reuse)
	fields.tank = r1
	fields.healer = r2
	fields.dps = r3
	return reuse
end

function Wrappers.GetPVPSessionStats(): GetPVPSessionStatsResults
	local r1, r2 = GetPVPSessionStats()
	return {
		honorableKills = r1,
		dishonorableKills = r2,
	}
end

function Wrappers.GetPVPSessionStatsInto(reuse: GetPVPSessionStatsResults): GetPVPSessionStatsResults
	local r1, r2 = GetPVPSessionStats()
	local fields = Reuse.fields(reuse)
	fields.honorableKills = r1
	fields.dishonorableKills = r2
	return reuse
end

function Wrappers.GetPVPYesterdayStats(): GetPVPYesterdayStatsResults
	local r1, r2 = GetPVPYesterdayStats()
	return {
		honorableKills = r1,
		dishonorableKills = r2,
	}
end

function Wrappers.GetPVPYesterdayStatsInto(reuse: GetPVPYesterdayStatsResults): GetPVPYesterdayStatsResults
	local r1, r2 = GetPVPYesterdayStats()
	local fields = Reuse.fields(reuse)
	fields.honorableKills = r1
	fields.dishonorableKills = r2
	return reuse
end

function Wrappers.GetPersonalRatedInfo(index: number): GetPersonalRatedInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8 = GetPersonalRatedInfo(index)
	return {
		rating = r1,
		seasonBest = r2,
		weeklyBest = r3,
		seasonPlayed = r4,
		seasonWon = r5,
		weeklyPlayed = r6,
		weeklyWon = r7,
		cap = r8,
	}
end

function Wrappers.GetPersonalRatedInfoInto(
	reuse: GetPersonalRatedInfoResults,
	index: number
): GetPersonalRatedInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8 = GetPersonalRatedInfo(index)
	local fields = Reuse.fields(reuse)
	fields.rating = r1
	fields.seasonBest = r2
	fields.weeklyBest = r3
	fields.seasonPlayed = r4
	fields.seasonWon = r5
	fields.weeklyPlayed = r6
	fields.weeklyWon = r7
	fields.cap = r8
	return reuse
end

function Wrappers.GetPetActionCooldown(index: number): GetPetActionCooldownResults
	local r1, r2, r3 = GetPetActionCooldown(index)
	return {
		startTime = r1,
		duration = r2,
		enable = r3,
	}
end

function Wrappers.GetPetActionCooldownInto(
	reuse: GetPetActionCooldownResults,
	index: number
): GetPetActionCooldownResults
	local r1, r2, r3 = GetPetActionCooldown(index)
	local fields = Reuse.fields(reuse)
	fields.startTime = r1
	fields.duration = r2
	fields.enable = r3
	return reuse
end

function Wrappers.GetPetActionInfo(index: number): GetPetActionInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9 = GetPetActionInfo(index)
	return {
		name = r1,
		texture = r2,
		isToken = r3,
		isActive = r4,
		autoCastAllowed = r5,
		autoCastEnabled = r6,
		spellID = r7,
		checksRange = r8,
		inRange = r9,
	}
end

function Wrappers.GetPetActionInfoInto(reuse: GetPetActionInfoResults, index: number): GetPetActionInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9 = GetPetActionInfo(index)
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.texture = r2
	fields.isToken = r3
	fields.isActive = r4
	fields.autoCastAllowed = r5
	fields.autoCastEnabled = r6
	fields.spellID = r7
	fields.checksRange = r8
	fields.inRange = r9
	return reuse
end

function Wrappers.GetPetCritChance(): GetPetCritChanceResults
	local r1, r2 = GetPetCritChance()
	return {
		meleeCrit = r1,
		spellCrit = r2,
	}
end

function Wrappers.GetPetCritChanceInto(reuse: GetPetCritChanceResults): GetPetCritChanceResults
	local r1, r2 = GetPetCritChance()
	local fields = Reuse.fields(reuse)
	fields.meleeCrit = r1
	fields.spellCrit = r2
	return reuse
end

function Wrappers.GetPetExperience(): GetPetExperienceResults
	local r1, r2 = GetPetExperience()
	return {
		currXP = r1,
		nextXP = r2,
	}
end

function Wrappers.GetPetExperienceInto(reuse: GetPetExperienceResults): GetPetExperienceResults
	local r1, r2 = GetPetExperience()
	local fields = Reuse.fields(reuse)
	fields.currXP = r1
	fields.nextXP = r2
	return reuse
end

function Wrappers.GetPetitionInfo(): GetPetitionInfoResults
	local r1, r2, r3, r4, r5, r6, r7 = GetPetitionInfo()
	return {
		petitionType = r1,
		title = r2,
		bodyText = r3,
		maxSigs = r4,
		originator = r5,
		isOriginator = r6,
		minSigs = r7,
	}
end

function Wrappers.GetPetitionInfoInto(reuse: GetPetitionInfoResults): GetPetitionInfoResults
	local r1, r2, r3, r4, r5, r6, r7 = GetPetitionInfo()
	local fields = Reuse.fields(reuse)
	fields.petitionType = r1
	fields.title = r2
	fields.bodyText = r3
	fields.maxSigs = r4
	fields.originator = r5
	fields.isOriginator = r6
	fields.minSigs = r7
	return reuse
end

function Wrappers.GetPhysicalScreenSize(): GetPhysicalScreenSizeResults
	local r1, r2 = GetPhysicalScreenSize()
	return {
		sizeX = r1,
		sizeY = r2,
	}
end

function Wrappers.GetPhysicalScreenSizeInto(reuse: GetPhysicalScreenSizeResults): GetPhysicalScreenSizeResults
	local r1, r2 = GetPhysicalScreenSize()
	local fields = Reuse.fields(reuse)
	fields.sizeX = r1
	fields.sizeY = r2
	return reuse
end

function Wrappers.GetPlayerFacing(): Maybe<number>
	return Maybe.of(GetPlayerFacing())
end

function Wrappers.GetPlayerFacingInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, GetPlayerFacing())
end

function Wrappers.GetPlayerInfoByGUID(guid: WOWGUID): Maybe<GetPlayerInfoByGUIDResults>
	local r1, r2, r3, r4, r5, r6, r7, r8 = GetPlayerInfoByGUID(guid)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil or r5 == nil or r6 == nil or r7 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		localizedClass = r1,
		englishClass = r2,
		localizedRace = r3,
		englishRace = r4,
		sex = r5,
		name = r6,
		realmName = r7,
		level = Maybe.of(r8),
	})
end

function Wrappers.GetPlayerInfoByGUIDInto(
	reuse: GetPlayerInfoByGUIDResults,
	guid: WOWGUID
): Maybe<GetPlayerInfoByGUIDResults>
	local r1, r2, r3, r4, r5, r6, r7, r8 = GetPlayerInfoByGUID(guid)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil or r5 == nil or r6 == nil or r7 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.localizedClass = r1
	fields.englishClass = r2
	fields.localizedRace = r3
	fields.englishRace = r4
	fields.sex = r5
	fields.name = r6
	fields.realmName = r7
	fields.level = Reuse.maybe(fields.level, r8)
	return Reuse.just(reuse)
end

function Wrappers.GetPossessInfo(index: number): GetPossessInfoResults
	local r1, r2, r3 = GetPossessInfo(index)
	return {
		texture = r1,
		spellID = r2,
		enabled = r3,
	}
end

function Wrappers.GetPossessInfoInto(reuse: GetPossessInfoResults, index: number): GetPossessInfoResults
	local r1, r2, r3 = GetPossessInfo(index)
	local fields = Reuse.fields(reuse)
	fields.texture = r1
	fields.spellID = r2
	fields.enabled = r3
	return reuse
end

function Wrappers.GetPowerRegen(): GetPowerRegenResults
	local r1, r2 = GetPowerRegen()
	return {
		basePowerRegen = r1,
		castingPowerRegen = r2,
	}
end

function Wrappers.GetPowerRegenInto(reuse: GetPowerRegenResults): GetPowerRegenResults
	local r1, r2 = GetPowerRegen()
	local fields = Reuse.fields(reuse)
	fields.basePowerRegen = r1
	fields.castingPowerRegen = r2
	return reuse
end

function Wrappers.GetPowerRegenForPowerType(powerType: Enum_PowerType): GetPowerRegenForPowerTypeResults
	local r1, r2 = GetPowerRegenForPowerType(powerType)
	return {
		basePowerRegen = r1,
		castingPowerRegen = r2,
	}
end

function Wrappers.GetPowerRegenForPowerTypeInto(
	reuse: GetPowerRegenForPowerTypeResults,
	powerType: Enum_PowerType
): GetPowerRegenForPowerTypeResults
	local r1, r2 = GetPowerRegenForPowerType(powerType)
	local fields = Reuse.fields(reuse)
	fields.basePowerRegen = r1
	fields.castingPowerRegen = r2
	return reuse
end

function Wrappers.GetProfessionInfo(index: number): GetProfessionInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11 = GetProfessionInfo(index)
	return {
		name = r1,
		icon = r2,
		skillLevel = r3,
		maxSkillLevel = r4,
		numAbilities = r5,
		spelloffset = r6,
		skillLine = r7,
		skillModifier = r8,
		specializationIndex = r9,
		specializationOffset = r10,
		skillLineName = r11,
	}
end

function Wrappers.GetProfessionInfoInto(reuse: GetProfessionInfoResults, index: number): GetProfessionInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11 = GetProfessionInfo(index)
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.icon = r2
	fields.skillLevel = r3
	fields.maxSkillLevel = r4
	fields.numAbilities = r5
	fields.spelloffset = r6
	fields.skillLine = r7
	fields.skillModifier = r8
	fields.specializationIndex = r9
	fields.specializationOffset = r10
	fields.skillLineName = r11
	return reuse
end

function Wrappers.GetProfessions(): GetProfessionsResults
	local r1, r2, r3, r4, r5 = GetProfessions()
	return {
		prof1 = r1,
		prof2 = r2,
		archaeology = r3,
		fishing = r4,
		cooking = r5,
	}
end

function Wrappers.GetProfessionsInto(reuse: GetProfessionsResults): GetProfessionsResults
	local r1, r2, r3, r4, r5 = GetProfessions()
	local fields = Reuse.fields(reuse)
	fields.prof1 = r1
	fields.prof2 = r2
	fields.archaeology = r3
	fields.fishing = r4
	fields.cooking = r5
	return reuse
end

function Wrappers.GetPvpTalentInfoByID(
	talentID: number,
	specGroupIndex: number?,
	isInspect: boolean?,
	inspectedUnit: string?
): GetPvpTalentInfoByIDResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11 =
		GetPvpTalentInfoByID(talentID, specGroupIndex, isInspect, inspectedUnit)
	return {
		talentID = r1,
		name = r2,
		icon = r3,
		selected = r4,
		available = r5,
		spellID = r6,
		unlocked = r7,
		row = r8,
		column = r9,
		known = r10,
		grantedByAura = r11,
	}
end

function Wrappers.GetPvpTalentInfoByIDInto(
	reuse: GetPvpTalentInfoByIDResults,
	talentID: number,
	specGroupIndex: number?,
	isInspect: boolean?,
	inspectedUnit: string?
): GetPvpTalentInfoByIDResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11 =
		GetPvpTalentInfoByID(talentID, specGroupIndex, isInspect, inspectedUnit)
	local fields = Reuse.fields(reuse)
	fields.talentID = r1
	fields.name = r2
	fields.icon = r3
	fields.selected = r4
	fields.available = r5
	fields.spellID = r6
	fields.unlocked = r7
	fields.row = r8
	fields.column = r9
	fields.known = r10
	fields.grantedByAura = r11
	return reuse
end

function Wrappers.GetQuestBackgroundMaterial(): Maybe<string>
	return Maybe.of(GetQuestBackgroundMaterial())
end

function Wrappers.GetQuestBackgroundMaterialInto(reuse: Maybe<string>): Maybe<string>
	return Reuse.maybe(reuse, GetQuestBackgroundMaterial())
end

function Wrappers.GetQuestItemInfo(type: string, index: number): GetQuestItemInfoResults
	local r1, r2, r3, r4, r5, r6 = GetQuestItemInfo(type, index)
	return {
		name = r1,
		texture = r2,
		count = r3,
		quality = r4,
		isUsable = r5,
		itemID = r6,
	}
end

function Wrappers.GetQuestItemInfoInto(
	reuse: GetQuestItemInfoResults,
	type: string,
	index: number
): GetQuestItemInfoResults
	local r1, r2, r3, r4, r5, r6 = GetQuestItemInfo(type, index)
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.texture = r2
	fields.count = r3
	fields.quality = r4
	fields.isUsable = r5
	fields.itemID = r6
	return reuse
end

function Wrappers.GetQuestLogChoiceInfo(index: number, questID: number?): GetQuestLogChoiceInfoResults
	local r1, r2, r3, r4, r5, r6 = GetQuestLogChoiceInfo(index, questID)
	return {
		itemName = r1,
		itemTexture = r2,
		quantity = r3,
		quality = r4,
		isUsable = r5,
		itemID = r6,
	}
end

function Wrappers.GetQuestLogChoiceInfoInto(
	reuse: GetQuestLogChoiceInfoResults,
	index: number,
	questID: number?
): GetQuestLogChoiceInfoResults
	local r1, r2, r3, r4, r5, r6 = GetQuestLogChoiceInfo(index, questID)
	local fields = Reuse.fields(reuse)
	fields.itemName = r1
	fields.itemTexture = r2
	fields.quantity = r3
	fields.quality = r4
	fields.isUsable = r5
	fields.itemID = r6
	return reuse
end

function Wrappers.GetQuestLogLeaderBoard(objIndex: number, questIndex: number?): GetQuestLogLeaderBoardResults
	local r1, r2, r3 = GetQuestLogLeaderBoard(objIndex, questIndex)
	return {
		description = r1,
		objectiveType = r2,
		isCompleted = r3,
	}
end

function Wrappers.GetQuestLogLeaderBoardInto(
	reuse: GetQuestLogLeaderBoardResults,
	objIndex: number,
	questIndex: number?
): GetQuestLogLeaderBoardResults
	local r1, r2, r3 = GetQuestLogLeaderBoard(objIndex, questIndex)
	local fields = Reuse.fields(reuse)
	fields.description = r1
	fields.objectiveType = r2
	fields.isCompleted = r3
	return reuse
end

function Wrappers.GetQuestLogQuestText(questLogIndex: number?): GetQuestLogQuestTextResults
	local r1, r2 = GetQuestLogQuestText(questLogIndex)
	return {
		questDescription = r1,
		questObjectives = r2,
	}
end

function Wrappers.GetQuestLogQuestTextInto(
	reuse: GetQuestLogQuestTextResults,
	questLogIndex: number?
): GetQuestLogQuestTextResults
	local r1, r2 = GetQuestLogQuestText(questLogIndex)
	local fields = Reuse.fields(reuse)
	fields.questDescription = r1
	fields.questObjectives = r2
	return reuse
end

function Wrappers.GetQuestLogRewardInfo(itemIndex: number, questID: number?): GetQuestLogRewardInfoResults
	local r1, r2, r3, r4, r5, r6, r7 = GetQuestLogRewardInfo(itemIndex, questID)
	return {
		itemName = r1,
		itemTexture = r2,
		numItems = r3,
		quality = r4,
		isUsable = r5,
		itemID = r6,
		itemLevel = r7,
	}
end

function Wrappers.GetQuestLogRewardInfoInto(
	reuse: GetQuestLogRewardInfoResults,
	itemIndex: number,
	questID: number?
): GetQuestLogRewardInfoResults
	local r1, r2, r3, r4, r5, r6, r7 = GetQuestLogRewardInfo(itemIndex, questID)
	local fields = Reuse.fields(reuse)
	fields.itemName = r1
	fields.itemTexture = r2
	fields.numItems = r3
	fields.quality = r4
	fields.isUsable = r5
	fields.itemID = r6
	fields.itemLevel = r7
	return reuse
end

function Wrappers.GetQuestLogSpecialItemCooldown(questLogIndex: number): GetQuestLogSpecialItemCooldownResults
	local r1, r2, r3 = GetQuestLogSpecialItemCooldown(questLogIndex)
	return {
		start = r1,
		duration = r2,
		enable = r3,
	}
end

function Wrappers.GetQuestLogSpecialItemCooldownInto(
	reuse: GetQuestLogSpecialItemCooldownResults,
	questLogIndex: number
): GetQuestLogSpecialItemCooldownResults
	local r1, r2, r3 = GetQuestLogSpecialItemCooldown(questLogIndex)
	local fields = Reuse.fields(reuse)
	fields.start = r1
	fields.duration = r2
	fields.enable = r3
	return reuse
end

function Wrappers.GetQuestLogSpecialItemInfo(questLogIndex: number): GetQuestLogSpecialItemInfoResults
	local r1, r2, r3, r4 = GetQuestLogSpecialItemInfo(questLogIndex)
	return {
		link = Maybe.of(r1),
		item = r2,
		charges = r3,
		showItemWhenComplete = r4,
	}
end

function Wrappers.GetQuestLogSpecialItemInfoInto(
	reuse: GetQuestLogSpecialItemInfoResults,
	questLogIndex: number
): GetQuestLogSpecialItemInfoResults
	local r1, r2, r3, r4 = GetQuestLogSpecialItemInfo(questLogIndex)
	local fields = Reuse.fields(reuse)
	fields.link = Reuse.maybe(fields.link, r1)
	fields.item = r2
	fields.charges = r3
	fields.showItemWhenComplete = r4
	return reuse
end

function Wrappers.GetQuestObjectiveInfo(
	questID: number,
	objectiveIndex: number,
	displayComplete: boolean
): GetQuestObjectiveInfoResults
	local r1, r2, r3, r4, r5 = GetQuestObjectiveInfo(questID, objectiveIndex, displayComplete)
	return {
		text = r1,
		objectiveType = r2,
		finished = r3,
		fulfilled = r4,
		required = r5,
	}
end

function Wrappers.GetQuestObjectiveInfoInto(
	reuse: GetQuestObjectiveInfoResults,
	questID: number,
	objectiveIndex: number,
	displayComplete: boolean
): GetQuestObjectiveInfoResults
	local r1, r2, r3, r4, r5 = GetQuestObjectiveInfo(questID, objectiveIndex, displayComplete)
	local fields = Reuse.fields(reuse)
	fields.text = r1
	fields.objectiveType = r2
	fields.finished = r3
	fields.fulfilled = r4
	fields.required = r5
	return reuse
end

function Wrappers.GetRFDungeonInfo(index: number): GetRFDungeonInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r18, r19, r20, r21, r22, r23 =
		GetRFDungeonInfo(index)
	return {
		id = r1,
		name = r2,
		typeID = r3,
		subtypeID = r4,
		minLevel = r5,
		maxLevel = r6,
		recLevel = r7,
		minRecLevel = r8,
		maxRecLevel = r9,
		expansionLevel = r10,
		groupID = r11,
		textureFilename = r12,
		difficulty = r13,
		maxPlayers = r14,
		description = r15,
		isHoliday = r16,
		bonusRepAmount = r17,
		minPlayers = r18,
		isTimeWalking = r19,
		name2 = r20,
		minGearLevel = r21,
		isScaling = r22,
		lfgMapID = r23,
	}
end

function Wrappers.GetRFDungeonInfoInto(reuse: GetRFDungeonInfoResults, index: number): GetRFDungeonInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r18, r19, r20, r21, r22, r23 =
		GetRFDungeonInfo(index)
	local fields = Reuse.fields(reuse)
	fields.id = r1
	fields.name = r2
	fields.typeID = r3
	fields.subtypeID = r4
	fields.minLevel = r5
	fields.maxLevel = r6
	fields.recLevel = r7
	fields.minRecLevel = r8
	fields.maxRecLevel = r9
	fields.expansionLevel = r10
	fields.groupID = r11
	fields.textureFilename = r12
	fields.difficulty = r13
	fields.maxPlayers = r14
	fields.description = r15
	fields.isHoliday = r16
	fields.bonusRepAmount = r17
	fields.minPlayers = r18
	fields.isTimeWalking = r19
	fields.name2 = r20
	fields.minGearLevel = r21
	fields.isScaling = r22
	fields.lfgMapID = r23
	return reuse
end

function Wrappers.GetRaidDifficultyID(): Maybe<number>
	return Maybe.of(GetRaidDifficultyID())
end

function Wrappers.GetRaidDifficultyIDInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, GetRaidDifficultyID())
end

function Wrappers.GetRaidRosterInfo(raidIndex: number): GetRaidRosterInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12 = GetRaidRosterInfo(raidIndex)
	return {
		name = r1,
		rank = r2,
		subgroup = r3,
		level = r4,
		class = r5,
		fileName = r6,
		zone = Maybe.of(r7),
		online = r8,
		isDead = r9,
		role = r10,
		isML = r11,
		combatRole = r12,
	}
end

function Wrappers.GetRaidRosterInfoInto(reuse: GetRaidRosterInfoResults, raidIndex: number): GetRaidRosterInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12 = GetRaidRosterInfo(raidIndex)
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.rank = r2
	fields.subgroup = r3
	fields.level = r4
	fields.class = r5
	fields.fileName = r6
	fields.zone = Reuse.maybe(fields.zone, r7)
	fields.online = r8
	fields.isDead = r9
	fields.role = r10
	fields.isML = r11
	fields.combatRole = r12
	return reuse
end

function Wrappers.GetRaidTargetIndex(target: UnitToken): Maybe<number>
	return Maybe.of(GetRaidTargetIndex(target))
end

function Wrappers.GetRaidTargetIndexInto(reuse: Maybe<number>, target: UnitToken): Maybe<number>
	return Reuse.maybe(reuse, GetRaidTargetIndex(target))
end

function Wrappers.GetRangedHaste(): GetRangedHasteResults
	local r1, r2 = GetRangedHaste()
	return {
		result = r1,
		quiverHaste = r2,
	}
end

function Wrappers.GetRangedHasteInto(reuse: GetRangedHasteResults): GetRangedHasteResults
	local r1, r2 = GetRangedHaste()
	local fields = Reuse.fields(reuse)
	fields.result = r1
	fields.quiverHaste = r2
	return reuse
end

function Wrappers.GetRepairAllCost(): GetRepairAllCostResults
	local r1, r2 = GetRepairAllCost()
	return {
		repairAllCost = r1,
		canRepair = Maybe.of(r2),
	}
end

function Wrappers.GetRepairAllCostInto(reuse: GetRepairAllCostResults): GetRepairAllCostResults
	local r1, r2 = GetRepairAllCost()
	local fields = Reuse.fields(reuse)
	fields.repairAllCost = r1
	fields.canRepair = Reuse.maybe(fields.canRepair, r2)
	return reuse
end

function Wrappers.GetResSicknessDuration(): Maybe<string>
	return Maybe.of(GetResSicknessDuration())
end

function Wrappers.GetResSicknessDurationInto(reuse: Maybe<string>): Maybe<string>
	return Reuse.maybe(reuse, GetResSicknessDuration())
end

function Wrappers.GetRestState(): Maybe<GetRestStateResults>
	local r1, r2, r3 = GetRestState()
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		exhaustionID = r1,
		name = r2,
		factor = r3,
	})
end

function Wrappers.GetRestStateInto(reuse: GetRestStateResults): Maybe<GetRestStateResults>
	local r1, r2, r3 = GetRestState()
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.exhaustionID = r1
	fields.name = r2
	fields.factor = r3
	return Reuse.just(reuse)
end

function Wrappers.GetRestrictedAccountData(): GetRestrictedAccountDataResults
	local r1, r2, r3 = GetRestrictedAccountData()
	return {
		maxLevel = r1,
		maxMoney = r2,
		professionCap = r3,
	}
end

function Wrappers.GetRestrictedAccountDataInto(reuse: GetRestrictedAccountDataResults): GetRestrictedAccountDataResults
	local r1, r2, r3 = GetRestrictedAccountData()
	local fields = Reuse.fields(reuse)
	fields.maxLevel = r1
	fields.maxMoney = r2
	fields.professionCap = r3
	return reuse
end

function Wrappers.GetRuneCooldown(runeIndex: number): Maybe<GetRuneCooldownResults>
	local r1, r2, r3 = GetRuneCooldown(runeIndex)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		startTime = r1,
		duration = r2,
		isRuneReady = r3,
	})
end

function Wrappers.GetRuneCooldownInto(reuse: GetRuneCooldownResults, runeIndex: number): Maybe<GetRuneCooldownResults>
	local r1, r2, r3 = GetRuneCooldown(runeIndex)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.startTime = r1
	fields.duration = r2
	fields.isRuneReady = r3
	return Reuse.just(reuse)
end

function Wrappers.GetRuneCount(runeIndex: number): Maybe<number>
	return Maybe.of(GetRuneCount(runeIndex))
end

function Wrappers.GetRuneCountInto(reuse: Maybe<number>, runeIndex: number): Maybe<number>
	return Reuse.maybe(reuse, GetRuneCount(runeIndex))
end

function Wrappers.GetSavedInstanceEncounterInfo(
	instanceIndex: number,
	encounterIndex: number
): GetSavedInstanceEncounterInfoResults
	local r1, r2, r3, r4 = GetSavedInstanceEncounterInfo(instanceIndex, encounterIndex)
	return {
		bossName = r1,
		fileDataID = r2,
		isKilled = r3,
		unknown4 = r4,
	}
end

function Wrappers.GetSavedInstanceEncounterInfoInto(
	reuse: GetSavedInstanceEncounterInfoResults,
	instanceIndex: number,
	encounterIndex: number
): GetSavedInstanceEncounterInfoResults
	local r1, r2, r3, r4 = GetSavedInstanceEncounterInfo(instanceIndex, encounterIndex)
	local fields = Reuse.fields(reuse)
	fields.bossName = r1
	fields.fileDataID = r2
	fields.isKilled = r3
	fields.unknown4 = r4
	return reuse
end

function Wrappers.GetSavedInstanceInfo(index: number): GetSavedInstanceInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14 = GetSavedInstanceInfo(index)
	return {
		name = r1,
		lockoutId = r2,
		reset = r3,
		difficultyId = r4,
		locked = r5,
		extended = r6,
		instanceIDMostSig = r7,
		isRaid = r8,
		maxPlayers = r9,
		difficultyName = r10,
		numEncounters = r11,
		encounterProgress = r12,
		extendDisabled = r13,
		instanceId = r14,
	}
end

function Wrappers.GetSavedInstanceInfoInto(
	reuse: GetSavedInstanceInfoResults,
	index: number
): GetSavedInstanceInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14 = GetSavedInstanceInfo(index)
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.lockoutId = r2
	fields.reset = r3
	fields.difficultyId = r4
	fields.locked = r5
	fields.extended = r6
	fields.instanceIDMostSig = r7
	fields.isRaid = r8
	fields.maxPlayers = r9
	fields.difficultyName = r10
	fields.numEncounters = r11
	fields.encounterProgress = r12
	fields.extendDisabled = r13
	fields.instanceId = r14
	return reuse
end

function Wrappers.GetSavedWorldBossInfo(index: number): GetSavedWorldBossInfoResults
	local r1, r2, r3 = GetSavedWorldBossInfo(index)
	return {
		name = r1,
		worldBossID = r2,
		reset = r3,
	}
end

function Wrappers.GetSavedWorldBossInfoInto(
	reuse: GetSavedWorldBossInfoResults,
	index: number
): GetSavedWorldBossInfoResults
	local r1, r2, r3 = GetSavedWorldBossInfo(index)
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.worldBossID = r2
	fields.reset = r3
	return reuse
end

function Wrappers.GetSecondsUntilParentalControlsKick(): Maybe<number>
	return Maybe.of(GetSecondsUntilParentalControlsKick())
end

function Wrappers.GetSecondsUntilParentalControlsKickInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, GetSecondsUntilParentalControlsKick())
end

function Wrappers.GetSelectedArtifactInfo(): GetSelectedArtifactInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8 = GetSelectedArtifactInfo()
	return {
		artifactName = r1,
		artifactDescription = r2,
		artifactRarity = r3,
		artifactIcon = r4,
		hoverDescription = r5,
		keystoneCount = r6,
		bgTexture = r7,
		spellID = r8,
	}
end

function Wrappers.GetSelectedArtifactInfoInto(reuse: GetSelectedArtifactInfoResults): GetSelectedArtifactInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8 = GetSelectedArtifactInfo()
	local fields = Reuse.fields(reuse)
	fields.artifactName = r1
	fields.artifactDescription = r2
	fields.artifactRarity = r3
	fields.artifactIcon = r4
	fields.hoverDescription = r5
	fields.keystoneCount = r6
	fields.bgTexture = r7
	fields.spellID = r8
	return reuse
end

function Wrappers.GetSendMailItem(index: number): GetSendMailItemResults
	local r1, r2, r3, r4, r5 = GetSendMailItem(index)
	return {
		name = r1,
		itemID = r2,
		texture = r3,
		count = r4,
		quality = r5,
	}
end

function Wrappers.GetSendMailItemInto(reuse: GetSendMailItemResults, index: number): GetSendMailItemResults
	local r1, r2, r3, r4, r5 = GetSendMailItem(index)
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.itemID = r2
	fields.texture = r3
	fields.count = r4
	fields.quality = r5
	return reuse
end

function Wrappers.GetShapeshiftFormCooldown(index: number): GetShapeshiftFormCooldownResults
	local r1, r2, r3 = GetShapeshiftFormCooldown(index)
	return {
		startTime = r1,
		duration = r2,
		isActive = r3,
	}
end

function Wrappers.GetShapeshiftFormCooldownInto(
	reuse: GetShapeshiftFormCooldownResults,
	index: number
): GetShapeshiftFormCooldownResults
	local r1, r2, r3 = GetShapeshiftFormCooldown(index)
	local fields = Reuse.fields(reuse)
	fields.startTime = r1
	fields.duration = r2
	fields.isActive = r3
	return reuse
end

function Wrappers.GetShapeshiftFormInfo(index: number): GetShapeshiftFormInfoResults
	local r1, r2, r3, r4 = GetShapeshiftFormInfo(index)
	return {
		icon = r1,
		active = r2,
		castable = r3,
		spellID = r4,
	}
end

function Wrappers.GetShapeshiftFormInfoInto(
	reuse: GetShapeshiftFormInfoResults,
	index: number
): GetShapeshiftFormInfoResults
	local r1, r2, r3, r4 = GetShapeshiftFormInfo(index)
	local fields = Reuse.fields(reuse)
	fields.icon = r1
	fields.active = r2
	fields.castable = r3
	fields.spellID = r4
	return reuse
end

function Wrappers.GetSheathState(): Maybe<number>
	return Maybe.of(GetSheathState())
end

function Wrappers.GetSheathStateInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, GetSheathState())
end

function Wrappers.GetSoundEntryCount(soundKit: number): Maybe<number>
	return Maybe.of(GetSoundEntryCount(soundKit))
end

function Wrappers.GetSoundEntryCountInto(reuse: Maybe<number>, soundKit: number): Maybe<number>
	return Reuse.maybe(reuse, GetSoundEntryCount(soundKit))
end

function Wrappers.GetSourceLocation(): Maybe<string>
	return Maybe.of(GetSourceLocation())
end

function Wrappers.GetSourceLocationInto(reuse: Maybe<string>): Maybe<string>
	return Reuse.maybe(reuse, GetSourceLocation())
end

function Wrappers.GetSpecializationInfoByID(specID: number, gender: number?): GetSpecializationInfoByIDResults
	local r1, r2, r3, r4, r5, r6, r7 = GetSpecializationInfoByID(specID, gender)
	return {
		id = r1,
		name = r2,
		description = r3,
		icon = r4,
		role = r5,
		classFile = r6,
		className = r7,
	}
end

function Wrappers.GetSpecializationInfoByIDInto(
	reuse: GetSpecializationInfoByIDResults,
	specID: number,
	gender: number?
): GetSpecializationInfoByIDResults
	local r1, r2, r3, r4, r5, r6, r7 = GetSpecializationInfoByID(specID, gender)
	local fields = Reuse.fields(reuse)
	fields.id = r1
	fields.name = r2
	fields.description = r3
	fields.icon = r4
	fields.role = r5
	fields.classFile = r6
	fields.className = r7
	return reuse
end

function Wrappers.GetSpecializationInfoForClassID(
	classID: number,
	index: number,
	gender: Enum_UnitSex?
): GetSpecializationInfoForClassIDResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9 = GetSpecializationInfoForClassID(classID, index, gender)
	return {
		id = r1,
		name = r2,
		description = r3,
		icon = r4,
		role = r5,
		recommended = r6,
		allowedForBoost = r7,
		masterySpell1 = Maybe.of(r8),
		masterySpell2 = Maybe.of(r9),
	}
end

function Wrappers.GetSpecializationInfoForClassIDInto(
	reuse: GetSpecializationInfoForClassIDResults,
	classID: number,
	index: number,
	gender: Enum_UnitSex?
): GetSpecializationInfoForClassIDResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9 = GetSpecializationInfoForClassID(classID, index, gender)
	local fields = Reuse.fields(reuse)
	fields.id = r1
	fields.name = r2
	fields.description = r3
	fields.icon = r4
	fields.role = r5
	fields.recommended = r6
	fields.allowedForBoost = r7
	fields.masterySpell1 = Reuse.maybe(fields.masterySpell1, r8)
	fields.masterySpell2 = Reuse.maybe(fields.masterySpell2, r9)
	return reuse
end

function Wrappers.GetSpecializationInfoForSpecID(
	specID: number,
	gender: Enum_UnitSex?
): GetSpecializationInfoForSpecIDResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9 = GetSpecializationInfoForSpecID(specID, gender)
	return {
		id = r1,
		name = r2,
		description = r3,
		icon = r4,
		role = r5,
		recommended = r6,
		allowedForBoost = r7,
		masterySpell1 = Maybe.of(r8),
		masterySpell2 = Maybe.of(r9),
	}
end

function Wrappers.GetSpecializationInfoForSpecIDInto(
	reuse: GetSpecializationInfoForSpecIDResults,
	specID: number,
	gender: Enum_UnitSex?
): GetSpecializationInfoForSpecIDResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9 = GetSpecializationInfoForSpecID(specID, gender)
	local fields = Reuse.fields(reuse)
	fields.id = r1
	fields.name = r2
	fields.description = r3
	fields.icon = r4
	fields.role = r5
	fields.recommended = r6
	fields.allowedForBoost = r7
	fields.masterySpell1 = Reuse.maybe(fields.masterySpell1, r8)
	fields.masterySpell2 = Reuse.maybe(fields.masterySpell2, r9)
	return reuse
end

function Wrappers.GetSpecializationNameForSpecID(specID: number, gender: Enum_UnitSex?): Maybe<string>
	return Maybe.of(GetSpecializationNameForSpecID(specID, gender))
end

function Wrappers.GetSpecializationNameForSpecIDInto(
	reuse: Maybe<string>,
	specID: number,
	gender: Enum_UnitSex?
): Maybe<string>
	return Reuse.maybe(reuse, GetSpecializationNameForSpecID(specID, gender))
end

function Wrappers.GetSpellBaseCooldown(spellid: number): GetSpellBaseCooldownResults
	local r1, r2 = GetSpellBaseCooldown(spellid)
	return {
		cooldownMS = r1,
		gcdMS = r2,
	}
end

function Wrappers.GetSpellBaseCooldownInto(
	reuse: GetSpellBaseCooldownResults,
	spellid: number
): GetSpellBaseCooldownResults
	local r1, r2 = GetSpellBaseCooldown(spellid)
	local fields = Reuse.fields(reuse)
	fields.cooldownMS = r1
	fields.gcdMS = r2
	return reuse
end

function Wrappers.GetSpellBonusDamage(school: number): Maybe<number>
	return Maybe.of(GetSpellBonusDamage(school))
end

function Wrappers.GetSpellBonusDamageInto(reuse: Maybe<number>, school: number): Maybe<number>
	return Reuse.maybe(reuse, GetSpellBonusDamage(school))
end

function Wrappers.GetStatistic(category: number, index: number?): GetStatisticResults
	local r1, r2, r3 = GetStatistic(category, index)
	return {
		value = r1,
		skip = r2,
		id = r3,
	}
end

function Wrappers.GetStatisticInto(reuse: GetStatisticResults, category: number, index: number?): GetStatisticResults
	local r1, r2, r3 = GetStatistic(category, index)
	local fields = Reuse.fields(reuse)
	fields.value = r1
	fields.skip = r2
	fields.id = r3
	return reuse
end

function Wrappers.GetTalentTierInfo(
	tier: number,
	specGroupIndex: number,
	isInspect: boolean?,
	inspectUnit: string?
): GetTalentTierInfoResults
	local r1, r2, r3 = GetTalentTierInfo(tier, specGroupIndex, isInspect, inspectUnit)
	return {
		tierAvailable = r1,
		selectedTalent = r2,
		tierUnlockLevel = r3,
	}
end

function Wrappers.GetTalentTierInfoInto(
	reuse: GetTalentTierInfoResults,
	tier: number,
	specGroupIndex: number,
	isInspect: boolean?,
	inspectUnit: string?
): GetTalentTierInfoResults
	local r1, r2, r3 = GetTalentTierInfo(tier, specGroupIndex, isInspect, inspectUnit)
	local fields = Reuse.fields(reuse)
	fields.tierAvailable = r1
	fields.selectedTalent = r2
	fields.tierUnlockLevel = r3
	return reuse
end

function Wrappers.GetTaskInfo(questID: number): GetTaskInfoResults
	local r1, r2, r3 = GetTaskInfo(questID)
	return {
		isInArea = r1,
		isOnMap = r2,
		numObjectives = r3,
	}
end

function Wrappers.GetTaskInfoInto(reuse: GetTaskInfoResults, questID: number): GetTaskInfoResults
	local r1, r2, r3 = GetTaskInfo(questID)
	local fields = Reuse.fields(reuse)
	fields.isInArea = r1
	fields.isOnMap = r2
	fields.numObjectives = r3
	return reuse
end

function Wrappers.GetTexCoordsByGrid(
	xOffset: number,
	yOffset: number,
	textureWidth: number,
	textureHeight: number,
	gridWidth: number,
	gridHeight: number
): GetTexCoordsByGridResults
	local r1, r2, r3, r4 = GetTexCoordsByGrid(xOffset, yOffset, textureWidth, textureHeight, gridWidth, gridHeight)
	return {
		minX = r1,
		maxX = r2,
		minY = r3,
		maxY = r4,
	}
end

function Wrappers.GetTexCoordsByGridInto(
	reuse: GetTexCoordsByGridResults,
	xOffset: number,
	yOffset: number,
	textureWidth: number,
	textureHeight: number,
	gridWidth: number,
	gridHeight: number
): GetTexCoordsByGridResults
	local r1, r2, r3, r4 = GetTexCoordsByGrid(xOffset, yOffset, textureWidth, textureHeight, gridWidth, gridHeight)
	local fields = Reuse.fields(reuse)
	fields.minX = r1
	fields.maxX = r2
	fields.minY = r3
	fields.maxY = r4
	return reuse
end

function Wrappers.GetTexCoordsForRole(role: string): GetTexCoordsForRoleResults
	local r1, r2, r3, r4 = GetTexCoordsForRole(role)
	return {
		minX = r1,
		maxX = r2,
		minY = r3,
		maxY = r4,
	}
end

function Wrappers.GetTexCoordsForRoleInto(reuse: GetTexCoordsForRoleResults, role: string): GetTexCoordsForRoleResults
	local r1, r2, r3, r4 = GetTexCoordsForRole(role)
	local fields = Reuse.fields(reuse)
	fields.minX = r1
	fields.maxX = r2
	fields.minY = r3
	fields.maxY = r4
	return reuse
end

function Wrappers.GetTextureInfo(obj: Texture): GetTextureInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10 = GetTextureInfo(obj)
	return {
		assetName = r1,
		assetType = r2,
		ulX = r3,
		ulY = r4,
		blX = r5,
		blY = r6,
		urX = r7,
		urY = r8,
		brX = r9,
		brY = r10,
	}
end

function Wrappers.GetTextureInfoInto(reuse: GetTextureInfoResults, obj: Texture): GetTextureInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10 = GetTextureInfo(obj)
	local fields = Reuse.fields(reuse)
	fields.assetName = r1
	fields.assetType = r2
	fields.ulX = r3
	fields.ulY = r4
	fields.blX = r5
	fields.blY = r6
	fields.urX = r7
	fields.urY = r8
	fields.brX = r9
	fields.brY = r10
	return reuse
end

function Wrappers.GetThreatStatusColor(gameErrorIndex: number): GetThreatStatusColorResults
	local r1, r2, r3 = GetThreatStatusColor(gameErrorIndex)
	return {
		colorR = r1,
		colorG = r2,
		colorB = r3,
	}
end

function Wrappers.GetThreatStatusColorInto(
	reuse: GetThreatStatusColorResults,
	gameErrorIndex: number
): GetThreatStatusColorResults
	local r1, r2, r3 = GetThreatStatusColor(gameErrorIndex)
	local fields = Reuse.fields(reuse)
	fields.colorR = r1
	fields.colorG = r2
	fields.colorB = r3
	return reuse
end

function Wrappers.GetTitleName(titleMaskID: number): GetTitleNameResults
	local r1, r2 = GetTitleName(titleMaskID)
	return {
		titleString = r1,
		playerTitle = r2,
	}
end

function Wrappers.GetTitleNameInto(reuse: GetTitleNameResults, titleMaskID: number): GetTitleNameResults
	local r1, r2 = GetTitleName(titleMaskID)
	local fields = Reuse.fields(reuse)
	fields.titleString = r1
	fields.playerTitle = r2
	return reuse
end

function Wrappers.GetTotemCannotDismiss(slot: number): Maybe<boolean>
	return Maybe.of(GetTotemCannotDismiss(slot))
end

function Wrappers.GetTotemCannotDismissInto(reuse: Maybe<boolean>, slot: number): Maybe<boolean>
	return Reuse.maybe(reuse, GetTotemCannotDismiss(slot))
end

function Wrappers.GetTotemInfo(slot: number): Maybe<GetTotemInfoResults>
	local r1, r2, r3, r4, r5, r6, r7 = GetTotemInfo(slot)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil or r5 == nil or r6 == nil or r7 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		haveTotem = r1,
		totemName = r2,
		startTime = r3,
		duration = r4,
		icon = r5,
		modRate = r6,
		spellID = r7,
	})
end

function Wrappers.GetTotemInfoInto(reuse: GetTotemInfoResults, slot: number): Maybe<GetTotemInfoResults>
	local r1, r2, r3, r4, r5, r6, r7 = GetTotemInfo(slot)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil or r5 == nil or r6 == nil or r7 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.haveTotem = r1
	fields.totemName = r2
	fields.startTime = r3
	fields.duration = r4
	fields.icon = r5
	fields.modRate = r6
	fields.spellID = r7
	return Reuse.just(reuse)
end

function Wrappers.GetTotemTimeLeft(slot: number): Maybe<number>
	return Maybe.of(GetTotemTimeLeft(slot))
end

function Wrappers.GetTotemTimeLeftInto(reuse: Maybe<number>, slot: number): Maybe<number>
	return Reuse.maybe(reuse, GetTotemTimeLeft(slot))
end

function Wrappers.GetTradePlayerItemInfo(id: number): GetTradePlayerItemInfoResults
	local r1, r2, r3, r4, r5, r6 = GetTradePlayerItemInfo(id)
	return {
		name = r1,
		texture = r2,
		numItems = r3,
		quality = r4,
		enchantment = r5,
		canLoseTransmog = r6,
	}
end

function Wrappers.GetTradePlayerItemInfoInto(
	reuse: GetTradePlayerItemInfoResults,
	id: number
): GetTradePlayerItemInfoResults
	local r1, r2, r3, r4, r5, r6 = GetTradePlayerItemInfo(id)
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.texture = r2
	fields.numItems = r3
	fields.quality = r4
	fields.enchantment = r5
	fields.canLoseTransmog = r6
	return reuse
end

function Wrappers.GetTradeTargetItemInfo(index: number): GetTradeTargetItemInfoResults
	local r1, r2, r3, r4, r5, r6 = GetTradeTargetItemInfo(index)
	return {
		name = r1,
		texture = r2,
		quantity = r3,
		quality = r4,
		isUsable = r5,
		enchant = r6,
	}
end

function Wrappers.GetTradeTargetItemInfoInto(
	reuse: GetTradeTargetItemInfoResults,
	index: number
): GetTradeTargetItemInfoResults
	local r1, r2, r3, r4, r5, r6 = GetTradeTargetItemInfo(index)
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.texture = r2
	fields.quantity = r3
	fields.quality = r4
	fields.isUsable = r5
	fields.enchant = r6
	return reuse
end

function Wrappers.GetTrainerServiceAbilityReq(
	trainerIndex: number,
	reqIndex: number
): GetTrainerServiceAbilityReqResults
	local r1, r2 = GetTrainerServiceAbilityReq(trainerIndex, reqIndex)
	return {
		ability = r1,
		hasReq = r2,
	}
end

function Wrappers.GetTrainerServiceAbilityReqInto(
	reuse: GetTrainerServiceAbilityReqResults,
	trainerIndex: number,
	reqIndex: number
): GetTrainerServiceAbilityReqResults
	local r1, r2 = GetTrainerServiceAbilityReq(trainerIndex, reqIndex)
	local fields = Reuse.fields(reuse)
	fields.ability = r1
	fields.hasReq = r2
	return reuse
end

function Wrappers.GetTrainerServiceCost(index: number): GetTrainerServiceCostResults
	local r1, r2, r3 = GetTrainerServiceCost(index)
	return {
		serviceCost = r1,
		talentCost = r2,
		professionCost = r3,
	}
end

function Wrappers.GetTrainerServiceCostInto(
	reuse: GetTrainerServiceCostResults,
	index: number
): GetTrainerServiceCostResults
	local r1, r2, r3 = GetTrainerServiceCost(index)
	local fields = Reuse.fields(reuse)
	fields.serviceCost = r1
	fields.talentCost = r2
	fields.professionCost = r3
	return reuse
end

function Wrappers.GetTrainerServiceInfo(index: number): GetTrainerServiceInfoResults
	local r1, r2, r3, r4 = GetTrainerServiceInfo(index)
	return {
		name = r1,
		rank = r2,
		category = r3,
		expanded = r4,
	}
end

function Wrappers.GetTrainerServiceInfoInto(
	reuse: GetTrainerServiceInfoResults,
	index: number
): GetTrainerServiceInfoResults
	local r1, r2, r3, r4 = GetTrainerServiceInfo(index)
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.rank = r2
	fields.category = r3
	fields.expanded = r4
	return reuse
end

function Wrappers.GetTrainerServiceSkillReq(index: number): GetTrainerServiceSkillReqResults
	local r1, r2, r3 = GetTrainerServiceSkillReq(index)
	return {
		skillName = Maybe.of(r1),
		skillLevel = r2,
		hasReq = r3,
	}
end

function Wrappers.GetTrainerServiceSkillReqInto(
	reuse: GetTrainerServiceSkillReqResults,
	index: number
): GetTrainerServiceSkillReqResults
	local r1, r2, r3 = GetTrainerServiceSkillReq(index)
	local fields = Reuse.fields(reuse)
	fields.skillName = Reuse.maybe(fields.skillName, r1)
	fields.skillLevel = r2
	fields.hasReq = r3
	return reuse
end

function Wrappers.GetUICameraInfo(uiCameraID: number): GetUICameraInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10 = GetUICameraInfo(uiCameraID)
	return {
		posX = r1,
		posY = r2,
		posZ = r3,
		lookAtX = r4,
		lookAtY = r5,
		lookAtZ = r6,
		animID = r7,
		animVariation = r8,
		animFrame = r9,
		useModelCenter = r10,
	}
end

function Wrappers.GetUICameraInfoInto(reuse: GetUICameraInfoResults, uiCameraID: number): GetUICameraInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10 = GetUICameraInfo(uiCameraID)
	local fields = Reuse.fields(reuse)
	fields.posX = r1
	fields.posY = r2
	fields.posZ = r3
	fields.lookAtX = r4
	fields.lookAtY = r5
	fields.lookAtZ = r6
	fields.animID = r7
	fields.animVariation = r8
	fields.animFrame = r9
	fields.useModelCenter = r10
	return reuse
end

function Wrappers.GetUnitChargedPowerPoints(unit: UnitToken): Maybe<{ number }>
	return Maybe.of(GetUnitChargedPowerPoints(unit))
end

function Wrappers.GetUnitChargedPowerPointsInto(reuse: Maybe<{ number }>, unit: UnitToken): Maybe<{ number }>
	return Reuse.maybe(reuse, GetUnitChargedPowerPoints(unit))
end

function Wrappers.GetUnitPowerBarInfo(unitToken: UnitToken): Maybe<UnitPowerBarInfo>
	return Maybe.of(GetUnitPowerBarInfo(unitToken))
end

function Wrappers.GetUnitPowerBarInfoInto(reuse: Maybe<UnitPowerBarInfo>, unitToken: UnitToken): Maybe<UnitPowerBarInfo>
	return Reuse.maybe(reuse, GetUnitPowerBarInfo(unitToken))
end

function Wrappers.GetUnitPowerBarInfoByID(barID: number): Maybe<UnitPowerBarInfo>
	return Maybe.of(GetUnitPowerBarInfoByID(barID))
end

function Wrappers.GetUnitPowerBarInfoByIDInto(reuse: Maybe<UnitPowerBarInfo>, barID: number): Maybe<UnitPowerBarInfo>
	return Reuse.maybe(reuse, GetUnitPowerBarInfoByID(barID))
end

function Wrappers.GetUnitPowerBarStrings(unitToken: UnitToken): GetUnitPowerBarStringsResults
	local r1, r2, r3 = GetUnitPowerBarStrings(unitToken)
	return {
		name = Maybe.of(r1),
		tooltip = Maybe.of(r2),
		cost = Maybe.of(r3),
	}
end

function Wrappers.GetUnitPowerBarStringsInto(
	reuse: GetUnitPowerBarStringsResults,
	unitToken: UnitToken
): GetUnitPowerBarStringsResults
	local r1, r2, r3 = GetUnitPowerBarStrings(unitToken)
	local fields = Reuse.fields(reuse)
	fields.name = Reuse.maybe(fields.name, r1)
	fields.tooltip = Reuse.maybe(fields.tooltip, r2)
	fields.cost = Reuse.maybe(fields.cost, r3)
	return reuse
end

function Wrappers.GetUnitPowerBarStringsByID(barID: number): GetUnitPowerBarStringsByIDResults
	local r1, r2, r3 = GetUnitPowerBarStringsByID(barID)
	return {
		name = Maybe.of(r1),
		tooltip = Maybe.of(r2),
		cost = Maybe.of(r3),
	}
end

function Wrappers.GetUnitPowerBarStringsByIDInto(
	reuse: GetUnitPowerBarStringsByIDResults,
	barID: number
): GetUnitPowerBarStringsByIDResults
	local r1, r2, r3 = GetUnitPowerBarStringsByID(barID)
	local fields = Reuse.fields(reuse)
	fields.name = Reuse.maybe(fields.name, r1)
	fields.tooltip = Reuse.maybe(fields.tooltip, r2)
	fields.cost = Reuse.maybe(fields.cost, r3)
	return reuse
end

function Wrappers.GetUnitPowerBarTextureInfo(
	unitToken: UnitToken,
	textureIndex: number,
	timerIndex: number?
): GetUnitPowerBarTextureInfoResults
	local r1, r2, r3, r4, r5 = GetUnitPowerBarTextureInfo(unitToken, textureIndex, timerIndex)
	return {
		texture = r1,
		colorR = r2,
		colorG = r3,
		colorB = r4,
		colorA = r5,
	}
end

function Wrappers.GetUnitPowerBarTextureInfoInto(
	reuse: GetUnitPowerBarTextureInfoResults,
	unitToken: UnitToken,
	textureIndex: number,
	timerIndex: number?
): GetUnitPowerBarTextureInfoResults
	local r1, r2, r3, r4, r5 = GetUnitPowerBarTextureInfo(unitToken, textureIndex, timerIndex)
	local fields = Reuse.fields(reuse)
	fields.texture = r1
	fields.colorR = r2
	fields.colorG = r3
	fields.colorB = r4
	fields.colorA = r5
	return reuse
end

function Wrappers.GetUnitPowerBarTextureInfoByID(
	barID: number,
	textureIndex: number
): GetUnitPowerBarTextureInfoByIDResults
	local r1, r2, r3, r4, r5 = GetUnitPowerBarTextureInfoByID(barID, textureIndex)
	return {
		texture = r1,
		colorR = r2,
		colorG = r3,
		colorB = r4,
		colorA = r5,
	}
end

function Wrappers.GetUnitPowerBarTextureInfoByIDInto(
	reuse: GetUnitPowerBarTextureInfoByIDResults,
	barID: number,
	textureIndex: number
): GetUnitPowerBarTextureInfoByIDResults
	local r1, r2, r3, r4, r5 = GetUnitPowerBarTextureInfoByID(barID, textureIndex)
	local fields = Reuse.fields(reuse)
	fields.texture = r1
	fields.colorR = r2
	fields.colorG = r3
	fields.colorB = r4
	fields.colorA = r5
	return reuse
end

function Wrappers.GetUnitSpeed(unit: UnitToken): GetUnitSpeedResults
	local r1, r2, r3, r4 = GetUnitSpeed(unit)
	return {
		currentSpeed = r1,
		runSpeed = r2,
		flightSpeed = r3,
		swimSpeed = r4,
	}
end

function Wrappers.GetUnitSpeedInto(reuse: GetUnitSpeedResults, unit: UnitToken): GetUnitSpeedResults
	local r1, r2, r3, r4 = GetUnitSpeed(unit)
	local fields = Reuse.fields(reuse)
	fields.currentSpeed = r1
	fields.runSpeed = r2
	fields.flightSpeed = r3
	fields.swimSpeed = r4
	return reuse
end

function Wrappers.GetVehicleUIIndicator(vehicleIndicatorID: number): Maybe<GetVehicleUIIndicatorResults>
	local r1, r2 = GetVehicleUIIndicator(vehicleIndicatorID)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		backgroundTextureID = r1,
		numSeatIndicators = r2,
	})
end

function Wrappers.GetVehicleUIIndicatorInto(
	reuse: GetVehicleUIIndicatorResults,
	vehicleIndicatorID: number
): Maybe<GetVehicleUIIndicatorResults>
	local r1, r2 = GetVehicleUIIndicator(vehicleIndicatorID)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.backgroundTextureID = r1
	fields.numSeatIndicators = r2
	return Reuse.just(reuse)
end

function Wrappers.GetVehicleUIIndicatorSeat(
	vehicleIndicatorID: number,
	indicatorSeatIndex: number
): Maybe<GetVehicleUIIndicatorSeatResults>
	local r1, r2, r3 = GetVehicleUIIndicatorSeat(vehicleIndicatorID, indicatorSeatIndex)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		virtualSeatIndex = r1,
		xPos = r2,
		yPos = r3,
	})
end

function Wrappers.GetVehicleUIIndicatorSeatInto(
	reuse: GetVehicleUIIndicatorSeatResults,
	vehicleIndicatorID: number,
	indicatorSeatIndex: number
): Maybe<GetVehicleUIIndicatorSeatResults>
	local r1, r2, r3 = GetVehicleUIIndicatorSeat(vehicleIndicatorID, indicatorSeatIndex)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.virtualSeatIndex = r1
	fields.xPos = r2
	fields.yPos = r3
	return Reuse.just(reuse)
end

function Wrappers.GetWorldElapsedTime(timerID: number): GetWorldElapsedTimeResults
	local r1, r2, r3 = GetWorldElapsedTime(timerID)
	return {
		description = r1,
		elapsedTime = r2,
		type = r3,
	}
end

function Wrappers.GetWorldElapsedTimeInto(
	reuse: GetWorldElapsedTimeResults,
	timerID: number
): GetWorldElapsedTimeResults
	local r1, r2, r3 = GetWorldElapsedTime(timerID)
	local fields = Reuse.fields(reuse)
	fields.description = r1
	fields.elapsedTime = r2
	fields.type = r3
	return reuse
end

function Wrappers.GetWorldPVPQueueStatus(index: number): GetWorldPVPQueueStatusResults
	local r1, r2, r3, r4, r5, r6, r7 = GetWorldPVPQueueStatus(index)
	return {
		status = r1,
		mapName = Maybe.of(r2),
		queueID = r3,
		expireTime = r4,
		averageWaitTime = r5,
		queuedTime = r6,
		suspended = r7,
	}
end

function Wrappers.GetWorldPVPQueueStatusInto(
	reuse: GetWorldPVPQueueStatusResults,
	index: number
): GetWorldPVPQueueStatusResults
	local r1, r2, r3, r4, r5, r6, r7 = GetWorldPVPQueueStatus(index)
	local fields = Reuse.fields(reuse)
	fields.status = r1
	fields.mapName = Reuse.maybe(fields.mapName, r2)
	fields.queueID = r3
	fields.expireTime = r4
	fields.averageWaitTime = r5
	fields.queuedTime = r6
	fields.suspended = r7
	return reuse
end

function Wrappers.GetXPExhaustion(): Maybe<number>
	return Maybe.of(GetXPExhaustion())
end

function Wrappers.GetXPExhaustionInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, GetXPExhaustion())
end

function Wrappers.HasNoReleaseAura(): HasNoReleaseAuraResults
	local r1, r2, r3 = HasNoReleaseAura()
	return {
		hasCannotReleaseEffect = r1,
		longestDuration = r2,
		hasUntilCancelledDuration = r3,
	}
end

function Wrappers.HasNoReleaseAuraInto(reuse: HasNoReleaseAuraResults): HasNoReleaseAuraResults
	local r1, r2, r3 = HasNoReleaseAura()
	local fields = Reuse.fields(reuse)
	fields.hasCannotReleaseEffect = r1
	fields.longestDuration = r2
	fields.hasUntilCancelledDuration = r3
	return reuse
end

function Wrappers.HasPetUI(): HasPetUIResults
	local r1, r2 = HasPetUI()
	return {
		hasUI = r1,
		isHunterPet = r2,
	}
end

function Wrappers.HasPetUIInto(reuse: HasPetUIResults): HasPetUIResults
	local r1, r2 = HasPetUI()
	local fields = Reuse.fields(reuse)
	fields.hasUI = r1
	fields.isHunterPet = r2
	return reuse
end

function Wrappers.InGuildParty(): InGuildPartyResults
	local r1, r2, r3, r4 = InGuildParty()
	return {
		inGroup = r1,
		numGuildPresent = r2,
		numGuildRequired = r3,
		xpMultiplier = r4,
	}
end

function Wrappers.InGuildPartyInto(reuse: InGuildPartyResults): InGuildPartyResults
	local r1, r2, r3, r4 = InGuildParty()
	local fields = Reuse.fields(reuse)
	fields.inGroup = r1
	fields.numGuildPresent = r2
	fields.numGuildRequired = r3
	fields.xpMultiplier = r4
	return reuse
end

function Wrappers.IsActiveBattlefieldArena(): IsActiveBattlefieldArenaResults
	local r1, r2 = IsActiveBattlefieldArena()
	return {
		isArena = r1,
		isRegistered = r2,
	}
end

function Wrappers.IsActiveBattlefieldArenaInto(reuse: IsActiveBattlefieldArenaResults): IsActiveBattlefieldArenaResults
	local r1, r2 = IsActiveBattlefieldArena()
	local fields = Reuse.fields(reuse)
	fields.isArena = r1
	fields.isRegistered = r2
	return reuse
end

function Wrappers.IsCpuBound(): Maybe<boolean>
	return Maybe.of(IsCpuBound())
end

function Wrappers.IsCpuBoundInto(reuse: Maybe<boolean>): Maybe<boolean>
	return Reuse.maybe(reuse, IsCpuBound())
end

function Wrappers.IsInInstance(): IsInInstanceResults
	local r1, r2 = IsInInstance()
	return {
		isInInstance = r1,
		instanceType = r2,
	}
end

function Wrappers.IsInInstanceInto(reuse: IsInInstanceResults): IsInInstanceResults
	local r1, r2 = IsInInstance()
	local fields = Reuse.fields(reuse)
	fields.isInInstance = r1
	fields.instanceType = r2
	return reuse
end

function Wrappers.IsKeyDown(keyOrMouseName: string, excludeBindingState: boolean?): Maybe<boolean>
	return Maybe.of(IsKeyDown(keyOrMouseName, excludeBindingState))
end

function Wrappers.IsKeyDownInto(
	reuse: Maybe<boolean>,
	keyOrMouseName: string,
	excludeBindingState: boolean?
): Maybe<boolean>
	return Reuse.maybe(reuse, IsKeyDown(keyOrMouseName, excludeBindingState))
end

function Wrappers.IsLFGDungeonJoinable(dungeonID: number): IsLFGDungeonJoinableResults
	local r1, r2, r3, r4 = IsLFGDungeonJoinable(dungeonID)
	return {
		isAvailableForAll = r1,
		isAvailableForPlayer = r2,
		hideIfNotJoinable = r3,
		totalGroupSizeRequired = r4,
	}
end

function Wrappers.IsLFGDungeonJoinableInto(
	reuse: IsLFGDungeonJoinableResults,
	dungeonID: number
): IsLFGDungeonJoinableResults
	local r1, r2, r3, r4 = IsLFGDungeonJoinable(dungeonID)
	local fields = Reuse.fields(reuse)
	fields.isAvailableForAll = r1
	fields.isAvailableForPlayer = r2
	fields.hideIfNotJoinable = r3
	fields.totalGroupSizeRequired = r4
	return reuse
end

function Wrappers.IsLegacyDifficulty(difficultyID: number): Maybe<boolean>
	return Maybe.of(IsLegacyDifficulty(difficultyID))
end

function Wrappers.IsLegacyDifficultyInto(reuse: Maybe<boolean>, difficultyID: number): Maybe<boolean>
	return Reuse.maybe(reuse, IsLegacyDifficulty(difficultyID))
end

function Wrappers.ItemTextGetCreator(): Maybe<string>
	return Maybe.of(ItemTextGetCreator())
end

function Wrappers.ItemTextGetCreatorInto(reuse: Maybe<string>): Maybe<string>
	return Reuse.maybe(reuse, ItemTextGetCreator())
end

function Wrappers.JoinChannelByName(
	channelName: string,
	password: string?,
	frameID: number?,
	hasVoice: boolean
): JoinChannelByNameResults
	local r1, r2 = JoinChannelByName(channelName, password, frameID, hasVoice)
	return {
		type = r1,
		name = Maybe.of(r2),
	}
end

function Wrappers.JoinChannelByNameInto(
	reuse: JoinChannelByNameResults,
	channelName: string,
	password: string?,
	frameID: number?,
	hasVoice: boolean
): JoinChannelByNameResults
	local r1, r2 = JoinChannelByName(channelName, password, frameID, hasVoice)
	local fields = Reuse.fields(reuse)
	fields.type = r1
	fields.name = Reuse.maybe(fields.name, r2)
	return reuse
end

function Wrappers.JoinPermanentChannel(
	channelName: string,
	password: string?,
	frameID: number?,
	hasVoice: boolean?
): JoinPermanentChannelResults
	local r1, r2 = JoinPermanentChannel(channelName, password, frameID, hasVoice)
	return {
		type = r1,
		name = r2,
	}
end

function Wrappers.JoinPermanentChannelInto(
	reuse: JoinPermanentChannelResults,
	channelName: string,
	password: string?,
	frameID: number?,
	hasVoice: boolean?
): JoinPermanentChannelResults
	local r1, r2 = JoinPermanentChannel(channelName, password, frameID, hasVoice)
	local fields = Reuse.fields(reuse)
	fields.type = r1
	fields.name = r2
	return reuse
end

function Wrappers.JoinTemporaryChannel(
	channelName: string,
	password: string?,
	frameID: number?,
	hasVoice: boolean?
): JoinTemporaryChannelResults
	local r1, r2 = JoinTemporaryChannel(channelName, password, frameID, hasVoice)
	return {
		type = r1,
		name = r2,
	}
end

function Wrappers.JoinTemporaryChannelInto(
	reuse: JoinTemporaryChannelResults,
	channelName: string,
	password: string?,
	frameID: number?,
	hasVoice: boolean?
): JoinTemporaryChannelResults
	local r1, r2 = JoinTemporaryChannel(channelName, password, frameID, hasVoice)
	local fields = Reuse.fields(reuse)
	fields.type = r1
	fields.name = r2
	return reuse
end

function Wrappers.LoggingChat(newState: boolean?): Maybe<boolean>
	return Maybe.of(LoggingChat(newState))
end

function Wrappers.LoggingChatInto(reuse: Maybe<boolean>, newState: boolean?): Maybe<boolean>
	return Reuse.maybe(reuse, LoggingChat(newState))
end

function Wrappers.LoggingCombat(newState: boolean?): Maybe<boolean>
	return Maybe.of(LoggingCombat(newState))
end

function Wrappers.LoggingCombatInto(reuse: Maybe<boolean>, newState: boolean?): Maybe<boolean>
	return Reuse.maybe(reuse, LoggingCombat(newState))
end

function Wrappers.NoPlayTime(): Maybe<boolean>
	return Maybe.of(NoPlayTime())
end

function Wrappers.NoPlayTimeInto(reuse: Maybe<boolean>): Maybe<boolean>
	return Reuse.maybe(reuse, NoPlayTime())
end

function Wrappers.PartialPlayTime(): Maybe<boolean>
	return Maybe.of(PartialPlayTime())
end

function Wrappers.PartialPlayTimeInto(reuse: Maybe<boolean>): Maybe<boolean>
	return Reuse.maybe(reuse, PartialPlayTime())
end

function Wrappers.PlaySound(
	soundKitID: number,
	channel: string?,
	forceNoDuplicates: boolean?,
	runFinishCallback: boolean?
): PlaySoundResults
	local r1, r2 = PlaySound(soundKitID, channel, forceNoDuplicates, runFinishCallback)
	return {
		willPlay = r1,
		soundHandle = r2,
	}
end

function Wrappers.PlaySoundInto(
	reuse: PlaySoundResults,
	soundKitID: number,
	channel: string?,
	forceNoDuplicates: boolean?,
	runFinishCallback: boolean?
): PlaySoundResults
	local r1, r2 = PlaySound(soundKitID, channel, forceNoDuplicates, runFinishCallback)
	local fields = Reuse.fields(reuse)
	fields.willPlay = r1
	fields.soundHandle = r2
	return reuse
end

function Wrappers.PlaySoundFile(sound: number | string, channel: string?): PlaySoundFileResults
	local r1, r2 = PlaySoundFile(sound, channel)
	return {
		willPlay = r1,
		soundHandle = r2,
	}
end

function Wrappers.PlaySoundFileInto(
	reuse: PlaySoundFileResults,
	sound: number | string,
	channel: string?
): PlaySoundFileResults
	local r1, r2 = PlaySoundFile(sound, channel)
	local fields = Reuse.fields(reuse)
	fields.willPlay = r1
	fields.soundHandle = r2
	return reuse
end

function Wrappers.PlayerEffectiveAttackPower(): Maybe<PlayerEffectiveAttackPowerResults>
	local r1, r2, r3, r4, r5 = PlayerEffectiveAttackPower()
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil or r5 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		mainHandAttackPower = r1,
		offHandAttackPower = r2,
		rangedAttackPower = r3,
		baseAttackPower = r4,
		baseRangedAttackPower = r5,
	})
end

function Wrappers.PlayerEffectiveAttackPowerInto(
	reuse: PlayerEffectiveAttackPowerResults
): Maybe<PlayerEffectiveAttackPowerResults>
	local r1, r2, r3, r4, r5 = PlayerEffectiveAttackPower()
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil or r5 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.mainHandAttackPower = r1
	fields.offHandAttackPower = r2
	fields.rangedAttackPower = r3
	fields.baseAttackPower = r4
	fields.baseRangedAttackPower = r5
	return Reuse.just(reuse)
end

function Wrappers.PlayerGetTimerunningSeasonID(): Maybe<number>
	return Maybe.of(PlayerGetTimerunningSeasonID())
end

function Wrappers.PlayerGetTimerunningSeasonIDInto(reuse: Maybe<number>): Maybe<number>
	return Reuse.maybe(reuse, PlayerGetTimerunningSeasonID())
end

function Wrappers.PutItemInBag(inventoryID: number?): Maybe<boolean>
	return Maybe.of(PutItemInBag(inventoryID))
end

function Wrappers.PutItemInBagInto(reuse: Maybe<boolean>, inventoryID: number?): Maybe<boolean>
	return Reuse.maybe(reuse, PutItemInBag(inventoryID))
end

function Wrappers.SearchLFGGetNumResults(): SearchLFGGetNumResultsResults
	local r1, r2 = SearchLFGGetNumResults()
	return {
		numResults = r1,
		totalResults = r2,
	}
end

function Wrappers.SearchLFGGetNumResultsInto(reuse: SearchLFGGetNumResultsResults): SearchLFGGetNumResultsResults
	local r1, r2 = SearchLFGGetNumResults()
	local fields = Reuse.fields(reuse)
	fields.numResults = r1
	fields.totalResults = r2
	return reuse
end

function Wrappers.SecondsToTimeAbbrev(seconds: number): SecondsToTimeAbbrevResults
	local r1, r2 = SecondsToTimeAbbrev(seconds)
	return {
		format = r1,
		time = r2,
	}
end

function Wrappers.SecondsToTimeAbbrevInto(
	reuse: SecondsToTimeAbbrevResults,
	seconds: number
): SecondsToTimeAbbrevResults
	local r1, r2 = SecondsToTimeAbbrev(seconds)
	local fields = Reuse.fields(reuse)
	fields.format = r1
	fields.time = r2
	return reuse
end

function Wrappers.SecureCmdOptionParse(options: string): SecureCmdOptionParseResults
	local r1, r2 = SecureCmdOptionParse(options)
	return {
		result = r1,
		target = r2,
	}
end

function Wrappers.SecureCmdOptionParseInto(
	reuse: SecureCmdOptionParseResults,
	options: string
): SecureCmdOptionParseResults
	local r1, r2 = SecureCmdOptionParse(options)
	local fields = Reuse.fields(reuse)
	fields.result = r1
	fields.target = r2
	return reuse
end

function Wrappers.SplitTextIntoHeaderAndNonHeader(text: string): SplitTextIntoHeaderAndNonHeaderResults
	local r1, r2 = SplitTextIntoHeaderAndNonHeader(text)
	return {
		header = Maybe.of(r1),
		nonHeader = Maybe.of(r2),
	}
end

function Wrappers.SplitTextIntoHeaderAndNonHeaderInto(
	reuse: SplitTextIntoHeaderAndNonHeaderResults,
	text: string
): SplitTextIntoHeaderAndNonHeaderResults
	local r1, r2 = SplitTextIntoHeaderAndNonHeader(text)
	local fields = Reuse.fields(reuse)
	fields.header = Reuse.maybe(fields.header, r1)
	fields.nonHeader = Reuse.maybe(fields.nonHeader, r2)
	return reuse
end

function Wrappers.TaxiNodePosition(index: number): TaxiNodePositionResults
	local r1, r2 = TaxiNodePosition(index)
	return {
		x = r1,
		y = r2,
	}
end

function Wrappers.TaxiNodePositionInto(reuse: TaxiNodePositionResults, index: number): TaxiNodePositionResults
	local r1, r2 = TaxiNodePosition(index)
	local fields = Reuse.fields(reuse)
	fields.x = r1
	fields.y = r2
	return reuse
end

function Wrappers.UnitAlliedRaceInfo(unit: UnitToken): UnitAlliedRaceInfoResults
	local r1, r2 = UnitAlliedRaceInfo(unit)
	return {
		isAlliedRace = r1,
		hasHeritageArmorUnlocked = r2,
	}
end

function Wrappers.UnitAlliedRaceInfoInto(reuse: UnitAlliedRaceInfoResults, unit: UnitToken): UnitAlliedRaceInfoResults
	local r1, r2 = UnitAlliedRaceInfo(unit)
	local fields = Reuse.fields(reuse)
	fields.isAlliedRace = r1
	fields.hasHeritageArmorUnlocked = r2
	return reuse
end

function Wrappers.UnitArmor(unit: UnitToken): UnitArmorResults
	local r1, r2, r3, r4 = UnitArmor(unit)
	return {
		base = r1,
		effective = r2,
		real = r3,
		bonus = r4,
	}
end

function Wrappers.UnitArmorInto(reuse: UnitArmorResults, unit: UnitToken): UnitArmorResults
	local r1, r2, r3, r4 = UnitArmor(unit)
	local fields = Reuse.fields(reuse)
	fields.base = r1
	fields.effective = r2
	fields.real = r3
	fields.bonus = r4
	return reuse
end

function Wrappers.UnitAttackPower(unit: UnitToken): UnitAttackPowerResults
	local r1, r2, r3 = UnitAttackPower(unit)
	return {
		attackPower = r1,
		posBuff = r2,
		negBuff = r3,
	}
end

function Wrappers.UnitAttackPowerInto(reuse: UnitAttackPowerResults, unit: UnitToken): UnitAttackPowerResults
	local r1, r2, r3 = UnitAttackPower(unit)
	local fields = Reuse.fields(reuse)
	fields.attackPower = r1
	fields.posBuff = r2
	fields.negBuff = r3
	return reuse
end

function Wrappers.UnitAttackSpeed(unit: UnitToken): UnitAttackSpeedResults
	local r1, r2, r3 = UnitAttackSpeed(unit)
	return {
		attackSpeed = r1,
		offhandAttackSpeed = Maybe.of(r2),
		rangedAttackSpeed = Maybe.of(r3),
	}
end

function Wrappers.UnitAttackSpeedInto(reuse: UnitAttackSpeedResults, unit: UnitToken): UnitAttackSpeedResults
	local r1, r2, r3 = UnitAttackSpeed(unit)
	local fields = Reuse.fields(reuse)
	fields.attackSpeed = r1
	fields.offhandAttackSpeed = Reuse.maybe(fields.offhandAttackSpeed, r2)
	fields.rangedAttackSpeed = Reuse.maybe(fields.rangedAttackSpeed, r3)
	return reuse
end

function Wrappers.UnitBattlePetLevel(unit: UnitToken): Maybe<number>
	return Maybe.of(UnitBattlePetLevel(unit))
end

function Wrappers.UnitBattlePetLevelInto(reuse: Maybe<number>, unit: UnitToken): Maybe<number>
	return Reuse.maybe(reuse, UnitBattlePetLevel(unit))
end

function Wrappers.UnitBattlePetSpeciesID(unit: UnitToken): Maybe<number>
	return Maybe.of(UnitBattlePetSpeciesID(unit))
end

function Wrappers.UnitBattlePetSpeciesIDInto(reuse: Maybe<number>, unit: UnitToken): Maybe<number>
	return Reuse.maybe(reuse, UnitBattlePetSpeciesID(unit))
end

function Wrappers.UnitBattlePetType(unit: UnitToken): Maybe<number>
	return Maybe.of(UnitBattlePetType(unit))
end

function Wrappers.UnitBattlePetTypeInto(reuse: Maybe<number>, unit: UnitToken): Maybe<number>
	return Reuse.maybe(reuse, UnitBattlePetType(unit))
end

function Wrappers.UnitCastingDuration(unit: UnitTokenPvPRestrictedForAddOns): Maybe<LuaDurationObject>
	return Maybe.of(UnitCastingDuration(unit))
end

function Wrappers.UnitCastingDurationInto(
	reuse: Maybe<LuaDurationObject>,
	unit: UnitTokenPvPRestrictedForAddOns
): Maybe<LuaDurationObject>
	return Reuse.maybe(reuse, UnitCastingDuration(unit))
end

function Wrappers.UnitCastingInfo(unit: UnitTokenPvPRestrictedForAddOns): UnitCastingInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11 = UnitCastingInfo(unit)
	return {
		name = r1,
		displayName = r2,
		textureID = r3,
		startTimeMs = r4,
		endTimeMs = r5,
		isTradeskill = r6,
		castID = r7,
		notInterruptible = Maybe.of(r8),
		castingSpellID = r9,
		castBarID = Maybe.of(r10),
		delayTimeMs = r11,
	}
end

function Wrappers.UnitCastingInfoInto(
	reuse: UnitCastingInfoResults,
	unit: UnitTokenPvPRestrictedForAddOns
): UnitCastingInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11 = UnitCastingInfo(unit)
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.displayName = r2
	fields.textureID = r3
	fields.startTimeMs = r4
	fields.endTimeMs = r5
	fields.isTradeskill = r6
	fields.castID = r7
	fields.notInterruptible = Reuse.maybe(fields.notInterruptible, r8)
	fields.castingSpellID = r9
	fields.castBarID = Reuse.maybe(fields.castBarID, r10)
	fields.delayTimeMs = r11
	return reuse
end

function Wrappers.UnitChannelDuration(unit: UnitTokenPvPRestrictedForAddOns): Maybe<LuaDurationObject>
	return Maybe.of(UnitChannelDuration(unit))
end

function Wrappers.UnitChannelDurationInto(
	reuse: Maybe<LuaDurationObject>,
	unit: UnitTokenPvPRestrictedForAddOns
): Maybe<LuaDurationObject>
	return Reuse.maybe(reuse, UnitChannelDuration(unit))
end

function Wrappers.UnitChannelInfo(unit: UnitTokenPvPRestrictedForAddOns): UnitChannelInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11 = UnitChannelInfo(unit)
	return {
		name = r1,
		displayName = r2,
		textureID = r3,
		startTimeMs = r4,
		endTimeMs = r5,
		isTradeskill = r6,
		notInterruptible = Maybe.of(r7),
		spellID = r8,
		isEmpowered = r9,
		numEmpowerStages = r10,
		castBarID = Maybe.of(r11),
	}
end

function Wrappers.UnitChannelInfoInto(
	reuse: UnitChannelInfoResults,
	unit: UnitTokenPvPRestrictedForAddOns
): UnitChannelInfoResults
	local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11 = UnitChannelInfo(unit)
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.displayName = r2
	fields.textureID = r3
	fields.startTimeMs = r4
	fields.endTimeMs = r5
	fields.isTradeskill = r6
	fields.notInterruptible = Reuse.maybe(fields.notInterruptible, r7)
	fields.spellID = r8
	fields.isEmpowered = r9
	fields.numEmpowerStages = r10
	fields.castBarID = Reuse.maybe(fields.castBarID, r11)
	return reuse
end

function Wrappers.UnitClass(unit: UnitToken): Maybe<UnitClassResults>
	local r1, r2, r3 = UnitClass(unit)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		className = r1,
		classFilename = r2,
		classID = r3,
	})
end

function Wrappers.UnitClassInto(reuse: UnitClassResults, unit: UnitToken): Maybe<UnitClassResults>
	local r1, r2, r3 = UnitClass(unit)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.className = r1
	fields.classFilename = r2
	fields.classID = r3
	return Reuse.just(reuse)
end

function Wrappers.UnitClassBase(unit: UnitToken): Maybe<UnitClassBaseResults>
	local r1, r2 = UnitClassBase(unit)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		classFilename = r1,
		classID = r2,
	})
end

function Wrappers.UnitClassBaseInto(reuse: UnitClassBaseResults, unit: UnitToken): Maybe<UnitClassBaseResults>
	local r1, r2 = UnitClassBase(unit)
	if r1 == nil or r2 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.classFilename = r1
	fields.classID = r2
	return Reuse.just(reuse)
end

function Wrappers.UnitClassFromGUID(unitGUID: WOWGUID): Maybe<UnitClassFromGUIDResults>
	local r1, r2, r3 = UnitClassFromGUID(unitGUID)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		className = r1,
		classFilename = r2,
		classID = r3,
	})
end

function Wrappers.UnitClassFromGUIDInto(
	reuse: UnitClassFromGUIDResults,
	unitGUID: WOWGUID
): Maybe<UnitClassFromGUIDResults>
	local r1, r2, r3 = UnitClassFromGUID(unitGUID)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.className = r1
	fields.classFilename = r2
	fields.classID = r3
	return Reuse.just(reuse)
end

function Wrappers.UnitCreatureFamily(unit: UnitToken): UnitCreatureFamilyResults
	local r1, r2 = UnitCreatureFamily(unit)
	return {
		name = r1,
		id = r2,
	}
end

function Wrappers.UnitCreatureFamilyInto(reuse: UnitCreatureFamilyResults, unit: UnitToken): UnitCreatureFamilyResults
	local r1, r2 = UnitCreatureFamily(unit)
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.id = r2
	return reuse
end

function Wrappers.UnitCreatureID(unit: UnitToken): Maybe<number>
	return Maybe.of(UnitCreatureID(unit))
end

function Wrappers.UnitCreatureIDInto(reuse: Maybe<number>, unit: UnitToken): Maybe<number>
	return Reuse.maybe(reuse, UnitCreatureID(unit))
end

function Wrappers.UnitCreatureType(unit: UnitToken): UnitCreatureTypeResults
	local r1, r2 = UnitCreatureType(unit)
	return {
		name = r1,
		id = r2,
	}
end

function Wrappers.UnitCreatureTypeInto(reuse: UnitCreatureTypeResults, unit: UnitToken): UnitCreatureTypeResults
	local r1, r2 = UnitCreatureType(unit)
	local fields = Reuse.fields(reuse)
	fields.name = r1
	fields.id = r2
	return reuse
end

function Wrappers.UnitDamage(unit: UnitToken): UnitDamageResults
	local r1, r2, r3, r4, r5, r6, r7 = UnitDamage(unit)
	return {
		minDamage = r1,
		maxDamage = r2,
		offhandMinDamage = r3,
		offhandMaxDamage = r4,
		posBuff = r5,
		negBuff = r6,
		percent = r7,
	}
end

function Wrappers.UnitDamageInto(reuse: UnitDamageResults, unit: UnitToken): UnitDamageResults
	local r1, r2, r3, r4, r5, r6, r7 = UnitDamage(unit)
	local fields = Reuse.fields(reuse)
	fields.minDamage = r1
	fields.maxDamage = r2
	fields.offhandMinDamage = r3
	fields.offhandMaxDamage = r4
	fields.posBuff = r5
	fields.negBuff = r6
	fields.percent = r7
	return reuse
end

function Wrappers.UnitDefenseSkill(unit: UnitToken): UnitDefenseSkillResults
	local r1, r2 = UnitDefenseSkill(unit)
	return {
		base = r1,
		modifier = r2,
	}
end

function Wrappers.UnitDefenseSkillInto(reuse: UnitDefenseSkillResults, unit: UnitToken): UnitDefenseSkillResults
	local r1, r2 = UnitDefenseSkill(unit)
	local fields = Reuse.fields(reuse)
	fields.base = r1
	fields.modifier = r2
	return reuse
end

function Wrappers.UnitDetailedThreatSituation(
	unit: UnitToken,
	mobGUID: UnitToken
): Maybe<UnitDetailedThreatSituationResults>
	local r1, r2, r3, r4, r5 = UnitDetailedThreatSituation(unit, mobGUID)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil or r5 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		isTanking = r1,
		status = r2,
		scaledPercentage = r3,
		rawPercentage = r4,
		rawThreat = r5,
	})
end

function Wrappers.UnitDetailedThreatSituationInto(
	reuse: UnitDetailedThreatSituationResults,
	unit: UnitToken,
	mobGUID: UnitToken
): Maybe<UnitDetailedThreatSituationResults>
	local r1, r2, r3, r4, r5 = UnitDetailedThreatSituation(unit, mobGUID)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil or r5 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.isTanking = r1
	fields.status = r2
	fields.scaledPercentage = r3
	fields.rawPercentage = r4
	fields.rawThreat = r5
	return Reuse.just(reuse)
end

function Wrappers.UnitDistanceSquared(unit: UnitToken): UnitDistanceSquaredResults
	local r1, r2 = UnitDistanceSquared(unit)
	return {
		distance = r1,
		checkedDistance = r2,
	}
end

function Wrappers.UnitDistanceSquaredInto(
	reuse: UnitDistanceSquaredResults,
	unit: UnitToken
): UnitDistanceSquaredResults
	local r1, r2 = UnitDistanceSquared(unit)
	local fields = Reuse.fields(reuse)
	fields.distance = r1
	fields.checkedDistance = r2
	return reuse
end

function Wrappers.UnitEmpoweredChannelDuration(
	unit: UnitToken,
	includeHoldAtMaxTime: boolean?
): Maybe<LuaDurationObject>
	return Maybe.of(UnitEmpoweredChannelDuration(unit, includeHoldAtMaxTime))
end

function Wrappers.UnitEmpoweredChannelDurationInto(
	reuse: Maybe<LuaDurationObject>,
	unit: UnitToken,
	includeHoldAtMaxTime: boolean?
): Maybe<LuaDurationObject>
	return Reuse.maybe(reuse, UnitEmpoweredChannelDuration(unit, includeHoldAtMaxTime))
end

function Wrappers.UnitEmpoweredStageDurations(unit: UnitToken): Maybe<{ LuaDurationObject }>
	return Maybe.of(UnitEmpoweredStageDurations(unit))
end

function Wrappers.UnitEmpoweredStageDurationsInto(
	reuse: Maybe<{ LuaDurationObject }>,
	unit: UnitToken
): Maybe<{ LuaDurationObject }>
	return Reuse.maybe(reuse, UnitEmpoweredStageDurations(unit))
end

function Wrappers.UnitEmpoweredStagePercentages(unit: UnitToken, includeHoldAtMaxTime: boolean?): Maybe<{ number }>
	return Maybe.of(UnitEmpoweredStagePercentages(unit, includeHoldAtMaxTime))
end

function Wrappers.UnitEmpoweredStagePercentagesInto(
	reuse: Maybe<{ number }>,
	unit: UnitToken,
	includeHoldAtMaxTime: boolean?
): Maybe<{ number }>
	return Reuse.maybe(reuse, UnitEmpoweredStagePercentages(unit, includeHoldAtMaxTime))
end

function Wrappers.UnitFactionGroup(unitName: string, checkDisplayRace: boolean?): UnitFactionGroupResults
	local r1, r2 = UnitFactionGroup(unitName, checkDisplayRace)
	return {
		factionGroupTag = r1,
		localized = r2,
	}
end

function Wrappers.UnitFactionGroupInto(
	reuse: UnitFactionGroupResults,
	unitName: string,
	checkDisplayRace: boolean?
): UnitFactionGroupResults
	local r1, r2 = UnitFactionGroup(unitName, checkDisplayRace)
	local fields = Reuse.fields(reuse)
	fields.factionGroupTag = r1
	fields.localized = r2
	return reuse
end

function Wrappers.UnitFullName(unit: UnitToken): UnitFullNameResults
	local r1, r2 = UnitFullName(unit)
	return {
		unitName = r1,
		unitServer = r2,
	}
end

function Wrappers.UnitFullNameInto(reuse: UnitFullNameResults, unit: UnitToken): UnitFullNameResults
	local r1, r2 = UnitFullName(unit)
	local fields = Reuse.fields(reuse)
	fields.unitName = r1
	fields.unitServer = r2
	return reuse
end

function Wrappers.UnitGUID(unit: UnitTokenPvPRestrictedForAddOns): Maybe<WOWGUID>
	return Maybe.of(UnitGUID(unit))
end

function Wrappers.UnitGUIDInto(reuse: Maybe<WOWGUID>, unit: UnitTokenPvPRestrictedForAddOns): Maybe<WOWGUID>
	return Reuse.maybe(reuse, UnitGUID(unit))
end

function Wrappers.UnitGetAvailableRoles(unit: UnitToken): Maybe<UnitGetAvailableRolesResults>
	local r1, r2, r3 = UnitGetAvailableRoles(unit)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		tank = r1,
		healer = r2,
		dps = r3,
	})
end

function Wrappers.UnitGetAvailableRolesInto(
	reuse: UnitGetAvailableRolesResults,
	unit: UnitToken
): Maybe<UnitGetAvailableRolesResults>
	local r1, r2, r3 = UnitGetAvailableRoles(unit)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.tank = r1
	fields.healer = r2
	fields.dps = r3
	return Reuse.just(reuse)
end

function Wrappers.UnitGetIncomingHeals(
	unit: UnitTokenPvPRestrictedForAddOns,
	healerGUID: UnitTokenPvPRestrictedForAddOns?
): Maybe<number>
	return Maybe.of(UnitGetIncomingHeals(unit, healerGUID))
end

function Wrappers.UnitGetIncomingHealsInto(
	reuse: Maybe<number>,
	unit: UnitTokenPvPRestrictedForAddOns,
	healerGUID: UnitTokenPvPRestrictedForAddOns?
): Maybe<number>
	return Reuse.maybe(reuse, UnitGetIncomingHeals(unit, healerGUID))
end

function Wrappers.UnitInBattleground(unit: UnitToken?, partyIndex: number?): Maybe<number>
	return Maybe.of(UnitInBattleground(unit, partyIndex))
end

function Wrappers.UnitInBattlegroundInto(reuse: Maybe<number>, unit: UnitToken?, partyIndex: number?): Maybe<number>
	return Reuse.maybe(reuse, UnitInBattleground(unit, partyIndex))
end

function Wrappers.UnitInRaid(unit: UnitToken?, partyIndex: number?): Maybe<number>
	return Maybe.of(UnitInRaid(unit, partyIndex))
end

function Wrappers.UnitInRaidInto(reuse: Maybe<number>, unit: UnitToken?, partyIndex: number?): Maybe<number>
	return Reuse.maybe(reuse, UnitInRaid(unit, partyIndex))
end

function Wrappers.UnitInRange(unit: UnitToken): UnitInRangeResults
	local r1, r2 = UnitInRange(unit)
	return {
		inRange = r1,
		checkedRange = r2,
	}
end

function Wrappers.UnitInRangeInto(reuse: UnitInRangeResults, unit: UnitToken): UnitInRangeResults
	local r1, r2 = UnitInRange(unit)
	local fields = Reuse.fields(reuse)
	fields.inRange = r1
	fields.checkedRange = r2
	return reuse
end

function Wrappers.UnitIsBattlePet(unit: UnitToken): Maybe<boolean>
	return Maybe.of(UnitIsBattlePet(unit))
end

function Wrappers.UnitIsBattlePetInto(reuse: Maybe<boolean>, unit: UnitToken): Maybe<boolean>
	return Reuse.maybe(reuse, UnitIsBattlePet(unit))
end

function Wrappers.UnitIsUnit(unit1: UnitToken, unit2: UnitToken): Maybe<boolean>
	return Maybe.of(UnitIsUnit(unit1, unit2))
end

function Wrappers.UnitIsUnitInto(reuse: Maybe<boolean>, unit1: UnitToken, unit2: UnitToken): Maybe<boolean>
	return Reuse.maybe(reuse, UnitIsUnit(unit1, unit2))
end

function Wrappers.UnitName(unit: UnitToken): UnitNameResults
	local r1, r2 = UnitName(unit)
	return {
		unitName = r1,
		unitServer = r2,
	}
end

function Wrappers.UnitNameInto(reuse: UnitNameResults, unit: UnitToken): UnitNameResults
	local r1, r2 = UnitName(unit)
	local fields = Reuse.fields(reuse)
	fields.unitName = r1
	fields.unitServer = r2
	return reuse
end

function Wrappers.UnitNameFromGUID(unitGUID: WOWGUID): UnitNameFromGUIDResults
	local r1, r2 = UnitNameFromGUID(unitGUID)
	return {
		unitName = r1,
		unitServer = r2,
	}
end

function Wrappers.UnitNameFromGUIDInto(reuse: UnitNameFromGUIDResults, unitGUID: WOWGUID): UnitNameFromGUIDResults
	local r1, r2 = UnitNameFromGUID(unitGUID)
	local fields = Reuse.fields(reuse)
	fields.unitName = r1
	fields.unitServer = r2
	return reuse
end

function Wrappers.UnitNameUnmodified(unit: UnitToken): UnitNameUnmodifiedResults
	local r1, r2 = UnitNameUnmodified(unit)
	return {
		unitName = r1,
		unitServer = r2,
	}
end

function Wrappers.UnitNameUnmodifiedInto(reuse: UnitNameUnmodifiedResults, unit: UnitToken): UnitNameUnmodifiedResults
	local r1, r2 = UnitNameUnmodified(unit)
	local fields = Reuse.fields(reuse)
	fields.unitName = r1
	fields.unitServer = r2
	return reuse
end

function Wrappers.UnitPercentHealthFromGUID(unitGUID: WOWGUID): Maybe<number>
	return Maybe.of(UnitPercentHealthFromGUID(unitGUID))
end

function Wrappers.UnitPercentHealthFromGUIDInto(reuse: Maybe<number>, unitGUID: WOWGUID): Maybe<number>
	return Reuse.maybe(reuse, UnitPercentHealthFromGUID(unitGUID))
end

function Wrappers.UnitPhaseReason(unit: UnitToken): Maybe<Enum_PhaseReason>
	return Maybe.of(UnitPhaseReason(unit))
end

function Wrappers.UnitPhaseReasonInto(reuse: Maybe<Enum_PhaseReason>, unit: UnitToken): Maybe<Enum_PhaseReason>
	return Reuse.maybe(reuse, UnitPhaseReason(unit))
end

function Wrappers.UnitPosition(unit: UnitToken): UnitPositionResults
	local r1, r2, r3, r4 = UnitPosition(unit)
	return {
		positionX = r1,
		positionY = r2,
		positionZ = r3,
		mapID = r4,
	}
end

function Wrappers.UnitPositionInto(reuse: UnitPositionResults, unit: UnitToken): UnitPositionResults
	local r1, r2, r3, r4 = UnitPosition(unit)
	local fields = Reuse.fields(reuse)
	fields.positionX = r1
	fields.positionY = r2
	fields.positionZ = r3
	fields.mapID = r4
	return reuse
end

function Wrappers.UnitPowerBarTimerInfo(unit: UnitToken, index: number?): Maybe<UnitPowerBarTimerInfoResults>
	local r1, r2, r3, r4 = UnitPowerBarTimerInfo(unit, index)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		duration = r1,
		expiration = r2,
		barID = r3,
		auraID = r4,
	})
end

function Wrappers.UnitPowerBarTimerInfoInto(
	reuse: UnitPowerBarTimerInfoResults,
	unit: UnitToken,
	index: number?
): Maybe<UnitPowerBarTimerInfoResults>
	local r1, r2, r3, r4 = UnitPowerBarTimerInfo(unit, index)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.duration = r1
	fields.expiration = r2
	fields.barID = r3
	fields.auraID = r4
	return Reuse.just(reuse)
end

function Wrappers.UnitPowerType(unit: UnitTokenPvPRestrictedForAddOns, index: number?): Maybe<UnitPowerTypeResults>
	local r1, r2, r3, r4, r5 = UnitPowerType(unit, index)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil or r5 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		powerType = r1,
		powerTypeToken = r2,
		rgbX = r3,
		rgbY = r4,
		rgbZ = r5,
	})
end

function Wrappers.UnitPowerTypeInto(
	reuse: UnitPowerTypeResults,
	unit: UnitTokenPvPRestrictedForAddOns,
	index: number?
): Maybe<UnitPowerTypeResults>
	local r1, r2, r3, r4, r5 = UnitPowerType(unit, index)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil or r5 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.powerType = r1
	fields.powerTypeToken = r2
	fields.rgbX = r3
	fields.rgbY = r4
	fields.rgbZ = r5
	return Reuse.just(reuse)
end

function Wrappers.UnitPvpClassification(unit: UnitTokenPvPRestrictedForAddOns): Maybe<Enum_PvPUnitClassification>
	return Maybe.of(UnitPvpClassification(unit))
end

function Wrappers.UnitPvpClassificationInto(
	reuse: Maybe<Enum_PvPUnitClassification>,
	unit: UnitTokenPvPRestrictedForAddOns
): Maybe<Enum_PvPUnitClassification>
	return Reuse.maybe(reuse, UnitPvpClassification(unit))
end

function Wrappers.UnitRace(unit: UnitToken): Maybe<UnitRaceResults>
	local r1, r2, r3 = UnitRace(unit)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		localizedRaceName = r1,
		englishRaceName = r2,
		raceID = r3,
	})
end

function Wrappers.UnitRaceInto(reuse: UnitRaceResults, unit: UnitToken): Maybe<UnitRaceResults>
	local r1, r2, r3 = UnitRace(unit)
	if r1 == nil or r2 == nil or r3 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.localizedRaceName = r1
	fields.englishRaceName = r2
	fields.raceID = r3
	return Reuse.just(reuse)
end

function Wrappers.UnitRangedAttackPower(unit: UnitToken): UnitRangedAttackPowerResults
	local r1, r2, r3 = UnitRangedAttackPower(unit)
	return {
		attackPower = r1,
		posBuff = r2,
		negBuff = r3,
	}
end

function Wrappers.UnitRangedAttackPowerInto(
	reuse: UnitRangedAttackPowerResults,
	unit: UnitToken
): UnitRangedAttackPowerResults
	local r1, r2, r3 = UnitRangedAttackPower(unit)
	local fields = Reuse.fields(reuse)
	fields.attackPower = r1
	fields.posBuff = r2
	fields.negBuff = r3
	return reuse
end

function Wrappers.UnitRangedDamage(unit: UnitToken): UnitRangedDamageResults
	local r1, r2, r3, r4, r5, r6 = UnitRangedDamage(unit)
	return {
		speed = r1,
		minDamage = r2,
		maxDamage = r3,
		posBuff = r4,
		negBuff = r5,
		percent = r6,
	}
end

function Wrappers.UnitRangedDamageInto(reuse: UnitRangedDamageResults, unit: UnitToken): UnitRangedDamageResults
	local r1, r2, r3, r4, r5, r6 = UnitRangedDamage(unit)
	local fields = Reuse.fields(reuse)
	fields.speed = r1
	fields.minDamage = r2
	fields.maxDamage = r3
	fields.posBuff = r4
	fields.negBuff = r5
	fields.percent = r6
	return reuse
end

function Wrappers.UnitReaction(unit: UnitToken, target: UnitToken): Maybe<number>
	return Maybe.of(UnitReaction(unit, target))
end

function Wrappers.UnitReactionInto(reuse: Maybe<number>, unit: UnitToken, target: UnitToken): Maybe<number>
	return Reuse.maybe(reuse, UnitReaction(unit, target))
end

function Wrappers.UnitRealmRelationship(unit: UnitToken): Maybe<number>
	return Maybe.of(UnitRealmRelationship(unit))
end

function Wrappers.UnitRealmRelationshipInto(reuse: Maybe<number>, unit: UnitToken): Maybe<number>
	return Reuse.maybe(reuse, UnitRealmRelationship(unit))
end

function Wrappers.UnitResistance(unit: UnitToken, damageClass: Enum_Damageclass): UnitResistanceResults
	local r1, r2, r3, r4 = UnitResistance(unit, damageClass)
	return {
		baseResistance = r1,
		realResistance = r2,
		effectiveResistance = r3,
		bonusResistance = r4,
	}
end

function Wrappers.UnitResistanceInto(
	reuse: UnitResistanceResults,
	unit: UnitToken,
	damageClass: Enum_Damageclass
): UnitResistanceResults
	local r1, r2, r3, r4 = UnitResistance(unit, damageClass)
	local fields = Reuse.fields(reuse)
	fields.baseResistance = r1
	fields.realResistance = r2
	fields.effectiveResistance = r3
	fields.bonusResistance = r4
	return reuse
end

function Wrappers.UnitSelectionColor(unit: UnitToken, useExtendedColors: boolean?): UnitSelectionColorResults
	local r1, r2, r3, r4 = UnitSelectionColor(unit, useExtendedColors)
	return {
		resultR = r1,
		resultG = r2,
		resultB = r3,
		resultA = r4,
	}
end

function Wrappers.UnitSelectionColorInto(
	reuse: UnitSelectionColorResults,
	unit: UnitToken,
	useExtendedColors: boolean?
): UnitSelectionColorResults
	local r1, r2, r3, r4 = UnitSelectionColor(unit, useExtendedColors)
	local fields = Reuse.fields(reuse)
	fields.resultR = r1
	fields.resultG = r2
	fields.resultB = r3
	fields.resultA = r4
	return reuse
end

function Wrappers.UnitSetRole(unit: UnitToken, roleStr: string?): Maybe<boolean>
	return Maybe.of(UnitSetRole(unit, roleStr))
end

function Wrappers.UnitSetRoleInto(reuse: Maybe<boolean>, unit: UnitToken, roleStr: string?): Maybe<boolean>
	return Reuse.maybe(reuse, UnitSetRole(unit, roleStr))
end

function Wrappers.UnitSetRoleEnum(unit: UnitToken, role: Enum_LFGRole?): Maybe<boolean>
	return Maybe.of(UnitSetRoleEnum(unit, role))
end

function Wrappers.UnitSetRoleEnumInto(reuse: Maybe<boolean>, unit: UnitToken, role: Enum_LFGRole?): Maybe<boolean>
	return Reuse.maybe(reuse, UnitSetRoleEnum(unit, role))
end

function Wrappers.UnitSex(unit: UnitToken): Maybe<number>
	return Maybe.of(UnitSex(unit))
end

function Wrappers.UnitSexInto(reuse: Maybe<number>, unit: UnitToken): Maybe<number>
	return Reuse.maybe(reuse, UnitSex(unit))
end

function Wrappers.UnitSexBase(unit: UnitToken): Maybe<Enum_UnitSex>
	return Maybe.of(UnitSexBase(unit))
end

function Wrappers.UnitSexBaseInto(reuse: Maybe<Enum_UnitSex>, unit: UnitToken): Maybe<Enum_UnitSex>
	return Reuse.maybe(reuse, UnitSexBase(unit))
end

function Wrappers.UnitSpellTargetName(unit: UnitToken): Maybe<string>
	return Maybe.of(UnitSpellTargetName(unit))
end

function Wrappers.UnitSpellTargetNameInto(reuse: Maybe<string>, unit: UnitToken): Maybe<string>
	return Reuse.maybe(reuse, UnitSpellTargetName(unit))
end

function Wrappers.UnitStat(unit: UnitToken, index: number): UnitStatResults
	local r1, r2, r3, r4 = UnitStat(unit, index)
	return {
		currentStat = r1,
		effectiveStat = r2,
		statPositiveBuff = r3,
		statNegativeBuff = r4,
	}
end

function Wrappers.UnitStatInto(reuse: UnitStatResults, unit: UnitToken, index: number): UnitStatResults
	local r1, r2, r3, r4 = UnitStat(unit, index)
	local fields = Reuse.fields(reuse)
	fields.currentStat = r1
	fields.effectiveStat = r2
	fields.statPositiveBuff = r3
	fields.statNegativeBuff = r4
	return reuse
end

function Wrappers.UnitThreatLeadSituation(unit: UnitToken, mobGUID: UnitToken): Maybe<number>
	return Maybe.of(UnitThreatLeadSituation(unit, mobGUID))
end

function Wrappers.UnitThreatLeadSituationInto(reuse: Maybe<number>, unit: UnitToken, mobGUID: UnitToken): Maybe<number>
	return Reuse.maybe(reuse, UnitThreatLeadSituation(unit, mobGUID))
end

function Wrappers.UnitThreatPercentageOfLead(unit: UnitToken, mobGUID: UnitToken): Maybe<number>
	return Maybe.of(UnitThreatPercentageOfLead(unit, mobGUID))
end

function Wrappers.UnitThreatPercentageOfLeadInto(
	reuse: Maybe<number>,
	unit: UnitToken,
	mobGUID: UnitToken
): Maybe<number>
	return Reuse.maybe(reuse, UnitThreatPercentageOfLead(unit, mobGUID))
end

function Wrappers.UnitThreatSituation(unit: UnitToken, mobGUID: UnitToken?): Maybe<number>
	return Maybe.of(UnitThreatSituation(unit, mobGUID))
end

function Wrappers.UnitThreatSituationInto(reuse: Maybe<number>, unit: UnitToken, mobGUID: UnitToken?): Maybe<number>
	return Reuse.maybe(reuse, UnitThreatSituation(unit, mobGUID))
end

function Wrappers.UnitTokenFromGUID(unitGUID: WOWGUID): Maybe<string>
	return Maybe.of(UnitTokenFromGUID(unitGUID))
end

function Wrappers.UnitTokenFromGUIDInto(reuse: Maybe<string>, unitGUID: WOWGUID): Maybe<string>
	return Reuse.maybe(reuse, UnitTokenFromGUID(unitGUID))
end

function Wrappers.UnitTrialBankedLevels(unit: UnitToken): UnitTrialBankedLevelsResults
	local r1, r2, r3 = UnitTrialBankedLevels(unit)
	return {
		bankedLevels = r1,
		xpIntoCurrentLevel = r2,
		xpForNextLevel = r3,
	}
end

function Wrappers.UnitTrialBankedLevelsInto(
	reuse: UnitTrialBankedLevelsResults,
	unit: UnitToken
): UnitTrialBankedLevelsResults
	local r1, r2, r3 = UnitTrialBankedLevels(unit)
	local fields = Reuse.fields(reuse)
	fields.bankedLevels = r1
	fields.xpIntoCurrentLevel = r2
	fields.xpForNextLevel = r3
	return reuse
end

function Wrappers.UnitVehicleSeatInfo(unit: UnitToken, virtualSeatIndex: number): Maybe<UnitVehicleSeatInfoResults>
	local r1, r2, r3, r4, r5 = UnitVehicleSeatInfo(unit, virtualSeatIndex)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil or r5 == nil then
		return Maybe.nothing()
	end
	return Maybe.just({
		controlType = r1,
		occupantName = r2,
		serverName = r3,
		ejectable = r4,
		canSwitchSeats = r5,
	})
end

function Wrappers.UnitVehicleSeatInfoInto(
	reuse: UnitVehicleSeatInfoResults,
	unit: UnitToken,
	virtualSeatIndex: number
): Maybe<UnitVehicleSeatInfoResults>
	local r1, r2, r3, r4, r5 = UnitVehicleSeatInfo(unit, virtualSeatIndex)
	if r1 == nil or r2 == nil or r3 == nil or r4 == nil or r5 == nil then
		return Maybe.nothing()
	end
	local fields = Reuse.fields(reuse)
	fields.controlType = r1
	fields.occupantName = r2
	fields.serverName = r3
	fields.ejectable = r4
	fields.canSwitchSeats = r5
	return Reuse.just(reuse)
end

function Wrappers.UnitWeaponAttackPower(unit: UnitToken): UnitWeaponAttackPowerResults
	local r1, r2, r3 = UnitWeaponAttackPower(unit)
	return {
		mainHandWeaponAttackPower = r1,
		offHandWeaponAttackPower = r2,
		rangedWeaponAttackPower = r3,
	}
end

function Wrappers.UnitWeaponAttackPowerInto(
	reuse: UnitWeaponAttackPowerResults,
	unit: UnitToken
): UnitWeaponAttackPowerResults
	local r1, r2, r3 = UnitWeaponAttackPower(unit)
	local fields = Reuse.fields(reuse)
	fields.mainHandWeaponAttackPower = r1
	fields.offHandWeaponAttackPower = r2
	fields.rangedWeaponAttackPower = r3
	return reuse
end

function Wrappers.UnitWidgetSet(unit: UnitToken): Maybe<number>
	return Maybe.of(UnitWidgetSet(unit))
end

function Wrappers.UnitWidgetSetInto(reuse: Maybe<number>, unit: UnitToken): Maybe<number>
	return Reuse.maybe(reuse, UnitWidgetSet(unit))
end

function Wrappers.debuglocals(level: number): Maybe<string>
	return Maybe.of(debuglocals(level))
end

function Wrappers.debuglocalsInto(reuse: Maybe<string>, level: number): Maybe<string>
	return Reuse.maybe(reuse, debuglocals(level))
end

function Wrappers.dumpobject(value: LuaValueReference?): Maybe<LuaValueReference>
	return Maybe.of(dumpobject(value))
end

function Wrappers.dumpobjectInto(reuse: Maybe<LuaValueReference>, value: LuaValueReference?): Maybe<LuaValueReference>
	return Reuse.maybe(reuse, dumpobject(value))
end

function Wrappers.frexp(x: number): frexpResults
	local r1, r2 = frexp(x)
	return {
		m = r1,
		e = r2,
	}
end

function Wrappers.frexpInto(reuse: frexpResults, x: number): frexpResults
	local r1, r2 = frexp(x)
	local fields = Reuse.fields(reuse)
	fields.m = r1
	fields.e = r2
	return reuse
end

function Wrappers.gsub(
	s: string | number,
	pattern: string | number,
	repl: string | number | { [any]: any } | ((...any) -> ...any),
	n: number?
): gsubResults
	local r1, r2 = gsub(s, pattern, repl, n)
	return {
		result1 = r1,
		count = r2,
	}
end

function Wrappers.gsubInto(
	reuse: gsubResults,
	s: string | number,
	pattern: string | number,
	repl: string | number | { [any]: any } | ((...any) -> ...any),
	n: number?
): gsubResults
	local r1, r2 = gsub(s, pattern, repl, n)
	local fields = Reuse.fields(reuse)
	fields.result1 = r1
	fields.count = r2
	return reuse
end

function Wrappers.issecurevalue(value: unknown): issecurevalueResults
	local r1, r2 = issecurevalue(value)
	return {
		isSecure = r1,
		taint = Maybe.of(r2),
	}
end

function Wrappers.issecurevalueInto(reuse: issecurevalueResults, value: unknown): issecurevalueResults
	local r1, r2 = issecurevalue(value)
	local fields = Reuse.fields(reuse)
	fields.isSecure = r1
	fields.taint = Reuse.maybe(fields.taint, r2)
	return reuse
end

function Wrappers.tIndexOf(tbl: { [any]: any }, item: unknown): Maybe<number>
	return Maybe.of(tIndexOf(tbl, item))
end

function Wrappers.tIndexOfInto(reuse: Maybe<number>, tbl: { [any]: any }, item: unknown): Maybe<number>
	return Reuse.maybe(reuse, tIndexOf(tbl, item))
end

return Wrappers
