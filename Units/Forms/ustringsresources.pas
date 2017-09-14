unit UStringsResources;

{$mode objfpc}{$H+}

interface

resourcestring
// UFRMWallet
rsCannotLoadSSL           = 'Cannot load %s To use this software make sure this file is available on you system or reinstall the application';
rsCannotOpenWallet        = 'Cannot open your wallet... Perhaps another instance of Pascal Coin is active!';
rsWalletActivateError     = 'An error occurred during initialization. Application cannot continue: ' + #10+#10+'%s'+#10+#10+'Application will close...';
rsbbChKeyNameClkInpQueryC = 'Change Key name';
rsbbChKeyNameClkInpQueryE = 'Input new name';
rsMustSelectAKey          = 'Must select a Key';
rsSelectAtLeastOneAcn     = 'Must select at least 1 account';
rsSelectAtLeastOneCnt     = 'Select at least one connection';
rsNoMessage               = 'No message';
rsSendMessageNodes        = 'Send this message to &s nodes?'+#10
                           +'NOTE: Sending unauthorized messages will be considered spam and you will be banned'+#10+#10
                           +'Message: '+#10+ '%s';
rsSentTo                  = ' Sent to ';
rsMessageSentToNodes      = 'Message sent to %s nodes'+#10+'Message: '+#10+'%s';
rsCantDoOperationNow      = 'You cannot do this operation now:'+#10+#10;+'%s';
rsBooleanStrFalse         = 'False';
rsBooleanStrTrue          = 'True';
rsClientBytesRcvdOk       = '[%s-%s] %s';
rsClientBytesRcvdNoData   = '(no data)';
rsLastCommLess10sec       = ' - Last comunication <10 sec.'
rsLastCommTime            = ' - Last comunication %.2dm%.2ds';
rsClientIPSentReceived    = 'Client: IP:%s Block:%d Sent/Received:%d/%d Bytes - %s - Time offset %d - Active since %s %s';
rsMySelfIPSentReceived    = 'MySelf IP:%s Sent/Received:%d/%d Bytes - %s - Time offset %d - Active since %s %s';
rsRemoteSvrSentReceived   = 'Remote Server: IP:%s Block:%d Sent/Received:%d/%d Bytes - %s - Time offset %d - Active since %s %s';
rsDisconnectedClient      = 'Disconnected client: IP:%s - %s';
rsDisconnectedMySelf      = 'Disconnected MySelf IP:%s - %s';
rsDisconnectedRemoteSvr   = 'Disconnected Remote Server: IP:%s %s - %s';
rsConnectionsUpdate       = 'Connections Updated %s Clients:%d Servers:%d (valid servers:%d)';
rsDisconnectedConns       = 'Disconnected connections: %s';
rsAccnInfoNumberType      = 'Account: %s %s Type:%d';
rsAccnInfoCurrBalance     = 'Current balance: %s';
rsAccnInfoUpdatedBlock    = 'Updated on block: %d  (%d blocks ago)';
rsAccnInfoPublicKey       =  'Public key type: %s';
rsAccnInfoBase58PubKey    = 'Base58 Public key: %s'
rsAccnInfoAccnForSale     = '** Account is for sale: **';
rsAccnInfoPrice           = 'Price: %s';
rsAccnInfoSellerAccount   = 'Seller account (where to pay): %s';
rsAccnInfoPrivateSale     = '** Private sale **';
rsAccnInfoNewB58PubKey    = 'New Base58 Public key: %s';
rsAccnInfoSecPurchase     = 'PURCHASE IS SECURE UNTIL BLOCK %d (current %d, remains %d)';
rsAccnInfoUnSecPurchase   = 'PURCHASE IS NOT SECURE (Expired on block %d, current %d)';
rsOperInfoBlockNOpInside  = 'Block: %d/%d';
rsOperInfoBlock           = 'Block: %d';
rsOperInfoPendingOper     = '** Pending operation not included on blockchain **';
rsOperInfoOpTypeSubType   = 'OpType:%d Subtype:%d';
rsOperInfoOperationHash   = 'Operation Hash (ophash): %s';
rsOperInfoOldOperHash     = 'Old Operation Hash (old_ophash): %s';
rsOperInfoPayloadLength   = 'Payload length:%d';
rsOperInfoPayloadHuman    = 'Payload (human): %s';
rsOpenInfoPayloadHexa     = 'Payload (Hexadecimal): %s';
rsOperInfoFinalBalance    = 'Final balance: %s';
rsCantCreateDir           = 'Cannot create dir: %s';
rsTrayIconBalloonTitle    =  'Restoring the window.'
rsTrayIconBalloonHint     = 'Double click the system tray icon to restore Pascal Coin';
rslblBuild                = 'Build: %s';
rsDestroyingFormStart     = 'Destroying form - START';
rsSavingParams            = 'Saving params';
rsAssigningNilEvents      = 'Assigning nil events';
rsDestroyNodeNotifyEvnts  = 'Destroying NodeNotifyEvents';
rsAssigningNilToTNetData  = 'Assigning Nil to TNetData';
rsDestroyingGridOpers     = 'Destroying grids operators';
rsOrderedAccountsKeyList  = 'Ordered Accounts Key list';
rsDesactivatingNode       = 'Desactivating Node';
rsProcessingMessages1     = 'Processing messages 1';
rsDestroyingNode          = 'Destroying Node';
rsDestroyingWallet        = 'Destroying Wallet';
rsProcessingMessages2     = 'Processing messages 2';
rsDestroyingStringsList   = 'Destroying stringslist';
rsErrDestroyingFormStep   = 'Error destroying Form step: %s Errors (%s): %s';
rsDestroyingFormEnd       = 'Destroying form - END';
rsNewForMiner             = 'New for miner %s';
rsNewNodeIntNameFVersion  = 'New Node %s - %s Build:%s';
rsSelectAnAccount         = 'Select an account';
rsAccountNumber           = 'Account %s info';
rsOperationInfo           = 'Operation info';
rsAccnNoInfoAvailable     = 'No info available';
rsIndexAccnHighBalance    = 'Not found any account higher than %s with balance higher than %s';
rsFindOpHashClkInpQueryC  = 'Search operation by OpHash';
rsFindOpHashClkInpQueryE  = 'Insert Operation Hash value (OpHash)';
rsPrevAccnHighBalanceClk  = 'Not found any account lower than %s with balance higher than %s';
rsNewOperClkNoRowSelect   = 'No row selected';
rsOnNetBlackListUpdated   = 'BlackList Updated: %s by TID: %s';
rsOnNetBlkListIPLastConn  = 'Blacklist IP:%s:%d LastConnection:%s Reason: %s';
rsOnNetBlackListTotalIPs  = 'Total Blacklisted IPs: %d (Total %d)';
rsOnNetNodeSeverUpdated   = 'NodeServers Updated: %s Count: %s';
rsNetDataServerIP         = 'Server IP:%s:%d';
rsNetDataActive           = ' ** ACTIVE **';
rsNetDataTryingToConnect  = ' ** TRYING TO CONNECT **';
rsNetDataNotValid         = ' ** NOT VALID ** %s';
rsNetDataLastConnection   = ' Last connection: %s';
rsNetDataLastSeverConn    = ' Last server connection: %s';
rsNetDataLastAttpConnect  = ' Last attempt to connect: %s';
rsNetDataAttempts         = ' (Attempts: %s)';
rsOnNetStatChgActivPort   = 'Active (Port %s)';
rsOnNetStatChgSvrStopped  = 'Server stopped';
rsOnNetStatChgConnClient  = 'Connections:%d Clients:%d Servers:%d - Rcvd:%d Kb Send:%d Kb';
rsOnNewAccountError       = 'Error at OnNewAccount %s';
rsOnNewLogMessageMain     = ' MAIN:';
rsOnNewLogMessageTID      = ' TID:';
rsOnNewLogFormatDateTime  = 'dd/mm/yyyy hh:nn:ss.zzz';
rsOnNodeMsgEvMsgRcvdFrom  = '%s Message received from %s';
rsOnNodeMsgEvRcvdLength   = '% Message received from %s Length %s bytes';
rsOnNodeMsgEvReceived     = 'RECEIVED> %s';
rsOnNodeMsgEvDateTime     = '%s Message from %s'+#10+'Length %s bytes'+#10+#10;
rsOnNodeMsgEvValueHexa    = 'Value in hexadecimal:'+#10+'%s';
rsOnNodeMsgEvInternalMsg  = '%s Internal message: %s';
rsOnNodeMsgEvReceivedMsg  = 'You have received %d messages';
rsOnNodeMsgEvRcvdOneMsg   = 'You have received 1 message';
rssbSelectedAccnAddAllClk = 'You cannot operate with account %d because private key not found in your wallet';
rssbSelectedAccnAddClkNo  = 'No account selected';
rssbSelectedAccnAddClkMsg = 'You cannot add %s account because private key not found in your wallet.'#10+#10+'You''re not the owner!';
rsTimerUpdateStatusTimer  = 'Exception at TimerUpdate %s : %s';
rsNetDataNetConnClientIP  = 'Client: IP:%s';
rsNetDataNetConnServerIP  = 'Server: IP:%s';
rsNone                    = '(none)';
rsUpdateBlockChnStateLast = 'Last %s: %s sec. (Optimal %ss) Deviation %s');
rsUpdateBlockChnStateSecs = 'Last %d: %s sec. - %d: %s sec. - %d: %s sec. - %d: %s sec. - %d: %s sec.';
rslblCurrentBlockCaption  = '';
rslblCurrentAccntsCaption = '';
rslblCurrBlockTimeCaption = '';
rslblOpersPendingCaption  = '';
rslblCurrDifficCaption    = '';
rslblTimeAverageCaption   = '';
rslblTimeAverageAxCaption = '';
rslblMnrsClientsCaptionCn = '%s connected JSON-RPC clients';
rslblMnrsClientsCaptionNJ = 'No JSON-RPC clients';
rslblMnrsClientsCaptionNA = 'JSON-RPC server not active';
rsFLogFileName            = '%s%sPascalCointWallet.log';
rsFNodeNodeLogFileName    = '%s%sblocks.log';
rsUpDConnStatLastAccnTime = 'Last account time:%s';
rsUpDConnFormatDateTime   = 'dd/mm/yyyy hh:nn:ss';
rsUpDConnNoBlockChain     = 'NO BLOCKCHAIN: %s';
rslblNodeStatCaptionInit  = 'Initializing...';
rslblNodeStatCaptionDSvrs = 'Discovering servers';
rslblNodeStatCaptionObNBC = 'Obtaining new blockchain';
rslblNodeStatCaptionRunng = 'Running';
rslblNodeStatCaptionAlone = 'Alone in the world...';
rsFBackgroundPanelCaption = 'Please wait until finished: %s';
rsUpDPKeyscbMyPrivateKeys = '(All my private keys)';

//UFRMAbout
rslblBuildCaption         = 'Build: %s';

rslblProtocolVerCaption   = 'BlockChain Protocol: %d (%d)  -  Net Protocol: %d (%d)';

//UFRMNodesIp
rsNoValidIPinList         = 'No valid IP in list!';
rsbbOkClickRestartMsg     = 'Restart application to take effect';
rscbTryOnlyWSrvsClkAlert  = 'ALERT:'+#10+'If "%s" is checked '+#10+'and no valid server found, you will be alone!';

//UFRMOperation
rsNoWalletKeys               = 'No wallet keys';
rsErrorEncondingPayload      = 'Error encoding payload of sender account %s: %s';
rsSndrAcnnPvtKeyNotFoundW    = 'Sender account private key not found in Wallet';
rsOperationsTxtTransactTo    = 'Transaction to %s';
rsOperationsTxtChangePvtKey  = 'Change private key to %s';
rsNoOperationSelected        = 'No operation selected';
rsNoValidOperationToExecute  = 'No valid operation to execute';
rsTotalAmountDestWillReceiv  = 'Total amount that dest will receive: %s'+#10;
rsExecSenderAccnOperations   = 'Execute %s operations?'+#10+'Operation: %s'+#10+'%s Total fee: %s'+#10+#10
                              +'Note: This operation will be transmitted to the network!';
rsExececuteThisOperation     = 'Execute this operation:'+#10+#10+'%s'+#10+#10+'Note: This operation will be transmitted to the network!';
rsSuccesfullyExecutedOpers   = 'Successfully executed %s operations!'+#10+#10+'%s';
rsOneOrMoreOpsHasNotBeenExe  = 'One or more of your operations has not been executed:'+#10+'Errors:'+#10+'%s'+#10+#10
                              +'Total successfully executed operations: %s';
rsInpQueryWalletPassCaption  = 'Wallet password';
rsInpQueryWalletPassEnter    = 'Enter wallet password';
rsAllBalance                 = 'ALL BALANCE';
rsAccount                    = 'Account';
rsAccountsFormat             = '%s accounts';
rsAccounts                   = 'Accounts';
rsInvalidFeeValue            = 'Invalid fee value "%s"';
rsUpDOpBuyAccnCantBuyMultiOp = 'Cannot buy accounts with multioperations. Use only 1 account';
rsUpDOpBuyAccnInvalidAccnBuy = 'Invalid account to buy %s';
rsUpDOpBuyAccnInvalidAccnNum = 'Invalid account number';
rsUpDOpBuyAccnIsNotForSale   = 'Account %s is not for sale';
rsUpDOpBuyAccnInvAmountValue = 'Invalid amount value';
rsUpDOpBuyAccnPrice          = 'Account price %s'
rsUpDOpBuyAccnInsufficientFd = 'Insufficient funds';
rsUpDOpBuyAccnMustSelNewPKey = 'Must select a new private key';
rsUpDOpBuyAccnInvalidSlcdKey = 'Invalid selected key';
rsUpDOpBuyAccnOperNeedPr2Act = 'This operation needs PROTOCOL 2 active';
rsUpDChgInfoCantChgMultiOper = 'Cannot change info with multioperations. Use only 1 account';
rsUpDChgInfoAccnLockUntilBlc = 'Account %s is locked until block %s';
rsUpDChgInfoInvaldSignerAccn = 'Invalid signer account';
rsUpDChgInfoSignerDNotExists = 'Signer account does not exists %s';
rsUpDChgInfoSignerLockUntBlc = 'Signer account %s is locked until block %s';
rsUpDChgInfoSignerIsntOwerAc = 'Signer account %s is not ower of account %s';
rsUpDChgInfoThisOperPr2Actve = 'This operation needs PROTOCOL 2 active';
rsUpDChgInfoNewNameIsntvalid = '"%s" is not a valid name: %s';
rsUpDChgInfoNameIsUsedByAccn = 'Name "%s" is used by account %s';
rsUpDChgInfoInvalidType      = 'Invalid type %s';
rsUpDChgInfoAccnNameTypeSame = 'Account name and type are the same. Not changed';
rsUpDChgInfolblChangeInfoErs = '%s can be updated';
rsUpDOpChgKeyMustSelNwPvtKey = 'Must select a new private key';
rsUpDOpChgKeyInvalidSlcdKey  = 'Invalid selected key';
rsUpDOpChgKeyNewKeyType      = 'New key type: %s';
rsUpDOpChgKeySelectChgType   = 'Select a change type';
rsUpDOpChgKeyInvaldSignrAccn = 'Invalid signer account';
rsUpDOpChgKeySignrAcDNtExist = 'Signer account does not exists %s';
rsUpDOpChgKeySignrAcIsNtOwer = 'Signer account %s is not ower of account %s';
rsUpDOpChgKeyNPublKeySameKey = 'New public key is the same public key';
rsUpDOpChgKeySignrAcLockUBlc = 'Signer account %s is locked until block %s';
rsUpDOpDeLstAccnIsNotForSale = 'Account %s is not for sale';
rsUpDOpDeLstAccnLockUntilBlc = 'Account %s is locked until block %s';
rsUpDOpDeLstInvalidSignrAccn = 'Invalid signer account';
rsUpDOpDeLstSignrAccnDNExsts = 'Signer account does not exists %s';
rsUpDOpDeLstAccnLockUntilBlc = 'Signer account %s is locked until block %s';
rsUpDOpDeLstSignrAccnIsNOwer = 'Signer account %s is not ower of delisted account %s';
rsUpDOpDeLstOperNeedsPr2Act  = 'This operation needs PROTOCOL 2 active';
rsUpDOpDeLstCanBeDeListed    = '%s can be delisted';
rsUpDOperOptNoWalletKeys     = 'No wallet keys';
rsUpDOperOptNoSenderAccount  = 'No sender account';
rsUpDOperOptPrivateKeyOfAccn = 'Private key of account %s not found in wallet';
rsUpDOperOptWalletIsPswPrtcd = 'Wallet is password protected. Need password';
rsUpDOperOptOnlyPubKeyAccn   = 'Only public key of account %s found in wallet. You cannot operate with this account';
rsUpDOperOptMustSelOperation = 'Must select an operation';
rsUpDOEncrypOldEncSenderKey  = 'Encrypted with sender public key';
rsUpDOEncrypOldEncDestPubKey = 'Encrypted with destination public key';
rsUpDOEncryOldEncWtOldPubKey = 'Encrypted with old public key';
rsUpDOEncryOldEncWtNewPubKey = 'Encrypted with new public key';
rsUpDOEncryOldEncWtTgtPubKey = 'Encrypted with target public key';
rsUpDOEncryEncWtSignerPubKey = 'Encrypted with signer public key';
rsUpDEncryEncWithBuyerPubKey = 'Encrypted with buyer public key';
rsUpDEncryEncWithTgtPubKey   = 'Encrypted with target public key';
rsUpDOpLstSaleInvalidPrice   = 'Invalid price';
rsUpDOpLstSaleInvalSignrAccn = 'Invalid signer account';
rsUpDOpLstSaleSignrAcDNExsts = 'Signer account does not exists %s';
rsUpDOpLstSaleInvalSellerAcc = 'Invalid seller account';
rsUpDOpLstSaleSellerAcDNExts = 'Seller account does not exists %s';
rsUpDOpLstSaleSellerAcCantBS = 'Seller account cannot be same account';
rsUpDOpLstSalePublicKey      =' Public key: %s';
rsUpDOpLstSaleNewKeyType     = 'New key type: %s';
rsUpDOpLstSaleNewPKeyPvtSale = 'New public key for private sale is the same public key';
rsUpDOpLstSaleInsLockingBlck = 'Insert locking block';
rsUpDOpLstSaleThisOperNP2Act = 'This operation needs PROTOCOL 2 active';
rsUpDOpLstSaleSelectSaleType = 'Select a sale type';
rsUpDOpTrnsInvalidDestAccn   = 'Invalid dest. account (%s)';
rsUpDOpTrnsInvalidAmount     = 'Invalid amount (%s0';
rsUpDOpTrnsSndrAndDestAcSame = 'Sender and dest account are the same';
rsUpDOpTrnsInsufficientFunds = 'Insufficient funds';
rsUpDPayLoadUnknowError      = 'Unknown error';
rsUpDPayloadErrorEncrypting  = 'Error encrypting';
rsUpDPayLoadInvalidDestAcNum = 'Invalid dest account number';
rsUpDPayLoadInvalidSngrAcNum = 'Invalid signer account number';
rsUpDPayLoadInvalidAccBuyNum = 'Invalid account to buy number';
rsUpDPayLoadErrorDev20170512 = 'ERROR DEV 20170512-1';
rsUpDPayLoadInvalidPLEnAcNum = 'Invalid payload encrypted account number: %s';
rsUpDPayLoadMustSelPrivatKey = 'Must select a private key';
rsUpDPayLoadPublicKeyError   = 'Public key: %s';
rsUpDPayLoadMustSelChngeType = 'Must select change type';
rsUpDPayLoadSelPvtKeyIsntVal = 'Selected private key is not valid to encode';
rsUpDPayLoadOperDNAllwKindPL = 'This operation does not allow this kind of payload';
rsUpDPayLoadMustSelEncrOptPL = 'Must select an encryption option for payload';
rsUpDPayLoadPLSizeIsBigger   = 'Payload size is bigger than %s (%s)';
rsPLDecSetOpReslblDateTimeC  = '(Pending block)';

//UFRMPascalCoinWalletConfig
rsPCWalletCfgClkExcptSvrPort = 'Server port and JSON-RPC Server miner port are equal!';
rsPCWalletCfgClkInvalFeeVal  = 'Invalid Fee value';
rsPCWalletCfgMustSelPvtKey   = 'Must select a private key';
rsPCWalletCfgInvalidPvtKey   = 'Invalid private key';
rsUpDPswClkWalltPswInpQueryC = 'Wallet Password';
rsUpDPswClkWalltPswInpQueryE = 'Insert Wallet Password';
rsUpDPswClkInvalidPsw        = 'Invalid password';
rsUpDPswClkInpQueryChgPswC   = 'Change password';
rsUpDPswClkInpQueryChgPswE   = 'Type new password';
rsUpDPswClkExpPswCantSpcChar = 'Password cannot start or end with a space character';
rsUpDPswClkInpQueryTypeAgain = 'Type new password again';
rsUpDPswClkTwoPswDifferent   = 'Two passwords are different!';
rsUpDPswClkPswChanged        = 'Password changed!'+#10+#10+'Please note that your new password is "%s"'+#10+#10+'(If you lose this password, you will lose your Wallet forever !)';
rsPCWalletFormCreateSvrPort  = '(Default %d)';
rsSetAppParamsException      = 'Exception at SetAppParams: %s';
rsUpDWltCfgWalletWithoutPsw  = 'Wallet without password, protect it!';
rsUpDWltCfgChangeWalletPsw   = 'Change Wallet password';
rsUpDWltCfgWalltWPswChangeIt = 'Wallet with password, change it!';
rsPCWalletCfgbbUpDatePswC    = '(Wallet password)';

//UFRMPayloadDecoder
rsPLDecdrSavMthsClkInpQueryC = 'Search operation by OpHash';
rsPLDecdrSavMthsClkInpQueryE = 'Insert Operation Hash value (OpHash)';
rsPLDecMthdPubPLClkInpQueryC = 'Possible passwords: %d';
rsPLDecDoFindValIsNHexaExcpt = 'Value is not an hexadecimal string';
rsPLDecDoFindValIsNotValidOH = 'Value is not a valid OpHash'
rsPLDecDoFindExcptIntError   = 'Internal error 20161114-1';
rsPLPgCtrlCghSaveNewDecMeths = 'Save new decode methods?';
rsPLDecSetOpReslblSenderSndC = 'Sender:';
rsPLDecSetOpReslblSenderAccC = 'Account:';
rsPLDecTryDclblDMtNotEncrPLC = 'Not encrypted payload';
rsPLDecTryDclblDMtEncrWtEC_C = 'Encrypted with EC %s';
rsPLDecTryDclblDMtEncrWtPsw  = 'Encrypted with pwd:"%s"';
rsPLDecTryDcMemoDcdTxtCNDecr = 'CANNOT DECRYPT';
rsPLDecTryDcMemoDcdTxtNPLoad = '(No payload)';

//UFRMSaleAccounts
rsSaleAccnsExecExcpNoWltKeys = 'No wallet keys';
rsSaleAccnsExecErrEncPLSdAcn = 'Error encoding payload of sender account %s: %s';
rsSaleAccnsExecExcpSAccPKNFW = 'Sender account private key not found in Wallet';
rsSaleAccnsExecOpsTxtTransTo = 'Transaction to %s';
rsSaleAccnsExecExcpInvSelKey = 'Invalid selected key';
rsSaleAccnsExecOpsTxtCgPvKey = 'Change private key to %s';
rsSaleAccnsExecOpsTxtNoOpSel = 'No operation selected';
rsSaleAccnsExecOpsTxtTNOwWKT = 'Transfer to a new owner with key type %s';
rsSaleAccnsExecExcpNoValOpEx = 'No valid operation to execute';
rsSaleAccnsExecAuxTtAmDsWRcv = 'Total amount that dest will receive: %s'+#10;
rsSaleAccnsExecMsgBxExecOper = 'Execute %s operations?'+#10+'Operation: %s'+#10+'%s Total fee: %s'+#10+#10+'Note: This operation will be transmitted to the network!';
rsSaleAccnsExecMsgBxExThisOp = 'Execute this operation:'+#10+#10+'%s'+#10+#10+'Note: This operation will be transmitted to the network!';
rsSaleAccnsExecMsgBxScsfulEx = 'Successfully executed %s operations!'+#10+#10+'%s';
rsSaleAccnsExecMsgBx1OrMrOps = 'One or more of your operations has not been executed:'+#10+'Errors: %s'+#10+#10+'Total successfully executed operations: %s';
rsSaleAccnsUpdAInfolblAccnC  = 'Account';
rsSaleAccnsUpDAInfolblCountC = '%s accounts';
rsSaleAccnsUpDAInfolblAcCAcs = 'Accounts';

//UFRMWalletKeys
rsWlltKeysChgNamClkInpQueryC = 'Change name';
rsWlltKeysChgNamClkInpQueryE = 'Input new key name:';
rsWlltKeysbbDelClkText       = 'Are you sure you want to delete the selected private key?'+#10+'%s'+#10+#10+
                               'Please note that this will forever remove access to accounts using this key...';
rsWlltKeysbbMsgBoxDelKey     = 'Delete key';
rsWlltKeysbbAreUSureToDelKey = 'Are you sure you want to delete?';
rsWlltKeysbbAreUSureToDelKC  = 'Delete key';
rsWlltKeysExprtAKClkExcNKeys = 'Your wallet is empty. No keys!';
rsWlltKeysExprtMsgWltBxNoPsw = 'Your wallet has NO PASSWORD'+#10+#10+
                               'It is recommend to protect your wallet with a password prior to exporting it!'+#10+#10+
                               'Continue without password protection?';
rsWlltKeysExprtMsgFileOvrwrt = 'This file exists:'+#10+'%s'+#10#10+'Overwrite?';
rsWlltKeysExprtMsgWltKExFile = 'Wallet key exported to a file:'+#10+'%s';
rsWlltKeysExprtbbPKClkInQryC = 'Export private key';
rsWlltKeysExprtbbPKClkInQryE = 'Insert a password to export';
rsWlltKeysExprtbbPKClkInQEPC = 'Export private key';
rsWlltKeysExprtbbPKClkInQEPE = 'Repeat the password to export';
rsWlltKeysExprtbbPswNMtcExcp = 'Passwords does not match!';
rsWlltKeysExprtbbPswEncrClpd = 'The password has been encrypted with your password and copied to the clipboard.'+#10+#10+
                               'Password: "%s"'+#10+#10+'Encrypted key value (Copied to the clipboard):'+#10+'%s'+#10+#10+'Length='+
                               '%s bytes';
rsWlltKeysExprtbbCnclOpExcp = 'Cancelled operation';
rsWlltKeysbbExpPublKClkMBox = 'The public key has been copied to the clipboard'+#10+#10+'Public key value:'+#10+'%s'+#10+#10+'Length=%s bytes';
rsWlltKeysbbImpKCFFileExcp  = 'Cannot find file %s';
rsWlltKeysbbImpKCWlltFIvDat = 'Wallet file has no valid data';
rsWlltKeysbbImpKCInpQueryC  = 'Import';
rsWlltKeysbbImpKCInpQueryE  = 'Enter the wallet file password:';
rsWlltKeysbbImpKCMBxPswNVld = 'Password entered is not valid, retry?';
rsWlltKeysWlltFileImpMsgBox = 'Wallet file imported successfully'+#10+#10+'File:%s'+#10+#10+'Total keys in wallet: %s'+#10+
                              'Imported private keys: %s'+#10+'Imported public keys only: %s'+#10+
                              'Duplicated (not imported): %s';
rsWlltKeysWlltFleAlrdMsgBox = 'Wallet file keys were already in your wallet. Nothing imported'+#10+#10+'File: %s'+#10+#10+'Total keys in wallet: %s';
rsWlltKeysbbImPKeyClkInpQrC = 'Import private key','Enter the password:';
rsWlltKeysbbImPKeyClkInpQrE = 'Enter the password:';
rsWlltKeysbbImPKeyClkMsgBox = 'Invalid password!';
rsWlltKeysbbImPKeyClkMBxIPw = 'Invalid password or corrupted data!';
rsWlltKeysbbInpQryImpPvKeyC = 'Import private key';
rsWlltKeysbbInpQryImpPvKeyE = 'Insert the password protected private key or raw private key';
rsWlltKeysbbNoValidKeyExcpt = 'No valid key';
rsWlltKeysbbInvalTextExcept = 'Invalid text... You must enter an hexadecimal value ("0".."9" or "A".."F")';
rsWlltKeysbbInvdlyFmtPKExcp = 'Invalidly formatted private key string. Ensure it is an encrypted private key export or raw private key hexstring.';
rsWlltKeysbbInvPswCrrDtaMBx = 'Invalid password and/or corrupted data!';
rsWlltKeysbbKeyAlrdyWlltExc = 'This key is already in your wallet!';
rsWlltKeysbbImportdDTimeStr = 'Imported %s';
rsWlltKeysbbSetANameInpBxC  = 'Set a name';
rsWlltKeysbbSetANameInpBxE  = 'Name for this private key:';
rsWlltKeysbbImportedPvtKey  = 'Imported private key';
rsWlltKeysbbImpPubKeyInpQrC = 'Import publick key';
rsWlltKeysbbImpPubKeyInpQrE = 'Insert the public key in hexa format or imported format';
rsWlltKeysbbImpPubKeyIPKVEx = 'Invalid public key value (Not hexa or not an imported format) '+#10+'%s';
rsWlltKeysbbImpPubKeyDNVPEx = 'This data is not a valid public key'+#10+'%s';
rsWlltKeysbbKeyAlrdExstWtEx = 'This key exists on your wallet';
rsWlltKeysbbImportdPbKeyStr = 'Imported public key %s';
rsWlltKeysbbSetANameImpQryC = 'Set a name';
rsWlltKeysbbSetANameImpQryE = 'Name for this private key:';
rsWlltKeysbbImpPubKeyMsgBox = 'Imported public key';
rsWlltKeysbbUpDPwChgPwIQryC = 'Change password';
rsWlltKeysbbUpDPwChgPwIQryE = 'Enter new password';
rsWlltKeysbbUpDPwPwCNSpcCEx = 'Password cannot start or end with a space character';
rsWlltKeysbbUpDPwCPwInpQryC = 'Change password';
rsWlltKeysbbUpDPwCPwInpQryE = 'Enter new password again';
rsWlltKeysbbUpDPw2PwDiffrEx = 'Two passwords are different!';
rsWlltKeysbbUpDPwChgdMsgBox = 'Password changed!'+#10+#10+'Please note that your new password is "%s"'+#10+#10+'(If you lose this password, you will lose your wallet forever!)';
rsWlltKeysbbUpDWltPwInpQryC = 'Wallet password';
rsWlltKeysbbUpDWltPwInpQryE = 'Enter wallet password';
rsWlltKeysbbUpDInvPwMsgBox  = 'Invalid password';
rsWlltKeysChkWKeyVPwMsgBox  = 'Wallet key is encrypted!'+#10+#10+'You must enter password to continue...';
rsWlltKeysChkWKeyVPwExcept  = 'Cannot continue without valid password';
rsWlltKeysUpDSelWKlblKName  = '(No name)';
rsWlltKeysUpDSelWKMemoPKTxt = '(No private key)';
rsWlltKeysUpDWKlblKEncWtoPw = 'Wallet without password';
rsWlltKeysUpDWKlblKEncPwPrd = 'Wallet is password protected';
rsWlltKeysUpDWKlblUpdPwCgPw = 'Change password';
rsWlltKeysUpDWKlblKEncWlEnc = 'Wallet is encrypted... need password!';
rsWlltKeysUpDWKEncrpNeedPsw = '%s (Encrypted, need password)';
rsWlltKeysUpDWKWithoutKey   = ' (* without key)';

//UFRMAccountSelect
rsAccnSelelctInvMinBlncExcp = 'Invalid Min Balance';
rsAccnSelelctInvMaxBlncExcp = 'Invalid Max Balance';
rsAccountSelectAll          = '(All)';

//UFRMNewPrivateKeyType
rsNewPvtKeybbOkClickExcept  = 'Select a key type'

{uses
  Classes, SysUtils;}

implementation

end.

