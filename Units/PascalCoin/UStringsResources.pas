unit UStringsResources;

{$mode objfpc}{$H+}

interface

resourcestring
rsCannotLoadSSL           = 'Cannot load %s To use this software make sure this file is available on you system or reinstall the application';
rsCannotOpenWallet        = 'Cannot open your wallet... Perhaps another instance of Pascal Coin is active!';
rsWalletActivateError     = 'An error occurred during initialization. Application cannot continue: &s Application will close...';
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

uses
  Classes, SysUtils;

implementation

end.

