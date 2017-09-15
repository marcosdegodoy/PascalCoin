unit UFRMWalletKeys;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

{ Copyright (c) 2016 by Albert Molina

  Distributed under the MIT software license, see the accompanying file LICENSE
  or visit http://www.opensource.org/licenses/mit-license.php.

  This unit is a part of Pascal Coin, a P2P crypto currency without need of
  historical operations.

  If you like it, consider a donation using BitCoin:
  16K3HCZRhFUtM8GdWRcfKeaa6KsuyxZaYk

  }

interface

uses
  Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UWalletKeys, Buttons,
  {$IFDEF FPC}LMessages,{$ENDIF}
  clipbrd, UConst, UCommon;

Const
  CM_PC_WalletKeysChanged = {$IFDEF FPC}LM_USER{$ELSE}WM_USER{$ENDIF} + 1;

type
  TFRMWalletKeys = class(TForm)
    lbWalletKeys: TListBox;
    bbExportPrivateKey: TBitBtn;
    lblEncryptionTypeCaption: TLabel;
    lblEncryptionType: TLabel;
    lblKeyNameCaption: TLabel;
    lblKeyName: TLabel;
    lblPrivateKeyCaption: TLabel;
    memoPrivateKey: TMemo;
    bbChangeName: TBitBtn;
    bbImportPrivateKey: TBitBtn;
    bbExportPublicKey: TBitBtn;
    bbImportPublicKey: TBitBtn;
    bbGenerateNewKey: TBitBtn;
    lblPrivateKeyCaption2: TLabel;
    bbDelete: TBitBtn;
    lblKeysEncrypted: TLabel;
    bbUpdatePassword: TBitBtn;
    bbExportAllWalletKeys: TBitBtn;
    SaveDialog: TSaveDialog;
    bbImportKeysFile: TBitBtn;
    OpenDialog: TOpenDialog;
    bbLock: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure bbChangeNameClick(Sender: TObject);
    procedure bbExportPrivateKeyClick(Sender: TObject);
    procedure bbImportPrivateKeyClick(Sender: TObject);
    procedure lbWalletKeysClick(Sender: TObject);
    procedure bbGenerateNewKeyClick(Sender: TObject);
    procedure bbExportPublicKeyClick(Sender: TObject);
    procedure bbDeleteClick(Sender: TObject);
    procedure bbImportPublicKeyClick(Sender: TObject);
    procedure bbUpdatePasswordClick(Sender: TObject);
    procedure bbExportAllWalletKeysClick(Sender: TObject);
    procedure bbImportKeysFileClick(Sender: TObject);
    procedure bbLockClick(Sender: TObject);
  private
    //FOldOnChanged : TNotifyEvent;
    FWalletKeys: TWalletKeys;
    procedure SetWalletKeys(const Value: TWalletKeys);
    procedure OnWalletKeysChanged(Sender : TObject);
    { Private declarations }
    Procedure UpdateWalletKeys;
    Procedure UpdateSelectedWalletKey;
    Function GetSelectedWalletKey(var WalletKey : TWalletKey) : Boolean;
    Function GetSelectedWalletKeyAndIndex(var WalletKey : TWalletKey; var index : Integer) : Boolean;
    Procedure CheckIsWalletKeyValidPassword;
    procedure CM_WalletChanged(var Msg: TMessage); message CM_PC_WalletKeysChanged;
  public
    { Public declarations }
    Property WalletKeys : TWalletKeys read FWalletKeys write SetWalletKeys;
    Destructor Destroy; override;
  end;

implementation

uses
{$IFnDEF FPC}
  Windows,
{$ELSE}
  LCLIntf, LCLType,
{$ENDIF}
  UCrypto, UAccounts, UFRMNewPrivateKeyType, UAES;

{$IFnDEF FPC}
  {$R *.dfm}
{$ELSE}
  {$R *.lfm}
{$ENDIF}

{ TFRMWalletKeys }

procedure TFRMWalletKeys.bbChangeNameClick(Sender: TObject);
Var wk : TWalletKey;
  s : String;
  index : integer;
begin
  if not GetSelectedWalletKeyAndIndex(wk,index) then exit;
  s := wk.Name;
  if InputQuery(rsWlltKeysChgNamClkInpQueryC,rsWlltKeysChgNamClkInpQueryE,s) then  // Change name - Input new key name:
  begin
    WalletKeys.SetName(index,s);
    UpdateWalletKeys;
  end;
end;

procedure TFRMWalletKeys.bbDeleteClick(Sender: TObject);
Var wk : TWalletKey;
  index : Integer;
  s : String;
begin
  if Not GetSelectedWalletKeyAndIndex(wk,index) then exit;
  s := Format(rsWlltKeysbbDelClkText,wk.Name); // Are you sure you want to delete the selected private key?#10%s#10#10
                                               //Please note that this will forever remove access to accounts using this key...
  if Application.MessageBox(Pchar(s),PChar(rsWlltKeysbbMsgBoxDelKey), // Delete key
    MB_YESNO+MB_DEFBUTTON2+MB_ICONWARNING)<>Idyes then exit;
  if Application.MessageBox(PChar(rsWlltKeysbbAreUSureToDelKey),PChar(rsWlltKeysbbAreUSureToDelKC), // Are you sure you want to delete? - Delete key
    MB_YESNO+MB_DEFBUTTON2+MB_ICONWARNING)<>Idyes then exit;
  WalletKeys.Delete(index);
  UpdateWalletKeys;
end;

procedure TFRMWalletKeys.bbExportAllWalletKeysClick(Sender: TObject);
Var efn : String;
  fs : TFileStream;
begin
  if WalletKeys.Count<=0 then raise Exception.Create(rsWlltKeysExprtAKClkExcNKeys); // Your wallet is empty. No keys!
  if ((WalletKeys.IsValidPassword) And (WalletKeys.WalletPassword='')) then begin
    if Application.MessageBox(PChar(rsWlltKeysExprtMsgWltBxNoPsw),  // Your wallet has NO PASSWORD#10#10It is recommend to protect your wallet with a password prior to exporting it!#10#10Continue without password protection?
                              PChar(Application.Title),MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)<>IdYes then exit;
  end;

  if Not SaveDialog.Execute then exit;
  efn := SaveDialog.FileName;
  if FileExists(efn) then begin
    if Application.MessageBox(PChar(Format(rsWlltKeysExprtMsgFileOvrwrt,efn)), // This file exists:#10%s#10#10Overwrite?
                              PChar(Application.Title),MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2)<>IdYes then exit;
  end;
  fs := TFileStream.Create(efn,fmCreate);
  try
    fs.Size := 0;
    WalletKeys.SaveToStream(fs);
  finally
    fs.Free;
  end;
  Application.MessageBox(PChar(Format(rsWlltKeysExprtMsgWltKExFile,efn)), // Wallet key exported to a file:#10%s
                         PChar(Application.Title),MB_OK+MB_ICONINFORMATION);
end;

procedure TFRMWalletKeys.bbExportPrivateKeyClick(Sender: TObject);
Var wk : TWalletKey;
  pwd1,pwd2, enc : String;
begin
  CheckIsWalletKeyValidPassword;
  if Not GetSelectedWalletKey(wk) then exit;
  if Assigned(wk.PrivateKey) then begin
    if InputQuery(rsWlltKeysExprtbbPKClkInQryC, rsWlltKeysExprtbbPKClkInQryE,pwd1) then begin // Export private key - Insert a password to export
      if InputQuery(rsWlltKeysExprtbbPKClkInQEPC,rsWlltKeysExprtbbPKClkInQEPE,pwd2) then begin // Export private key - Repeat the password to export
        if pwd1<>pwd2 then raise Exception.Create(rsWlltKeysExprtbbPswNMtcExcp); // Passwords does not match!
        enc := TCrypto.ToHexaString( TAESComp.EVP_Encrypt_AES256( wk.PrivateKey.ExportToRaw,pwd1) );
        Clipboard.AsText := enc;
        Application.MessageBox(PChar(Format(rsWlltKeysExprtbbPswEncrClpd,pwd1,enc,Inttostr(length(enc)))), // The password has been encrypted with your password and copied to the clipboard.#10#10Password: "%s"#10#10Encrypted key value (Copied to the clipboard):#10%s#10#10Length=%s bytes
          PChar(Application.Title),MB_OK+MB_ICONINFORMATION);
      end else raise Exception.Create(rsWlltKeysExprtbbCnclOpExcp); // Cancelled operation
    end;
  end;
end;

procedure TFRMWalletKeys.bbExportPublicKeyClick(Sender: TObject);
Var wk : TWalletKey;
  s : String;
begin
  CheckIsWalletKeyValidPassword;
  if Not GetSelectedWalletKey(wk) then exit;
  s := TAccountComp.AccountPublicKeyExport(wk.AccountKey);
  Clipboard.AsText := s;
  Application.MessageBox(PChar(Format(rsWlltKeysbbExpPublKClkMBox,s,Inttostr(length(s)))), // The public key has been copied to the clipboard#10#10Public key value:#10%s#10#10Length=%s bytes
                         PChar(Application.Title),MB_OK+MB_ICONINFORMATION);
end;

procedure TFRMWalletKeys.bbGenerateNewKeyClick(Sender: TObject);
Var FRM : TFRMNewPrivateKeyType;
begin
  CheckIsWalletKeyValidPassword;
  FRM := TFRMNewPrivateKeyType.Create(Self);
  try
    FRM.WalletKeys := WalletKeys;
    FRM.ShowModal;
    UpdateWalletKeys;
  finally
    FRM.Free;
  end;
end;

procedure TFRMWalletKeys.bbImportKeysFileClick(Sender: TObject);
Var wki : TWalletKeys;
  ifn,pwd : String;
  i : Integer;
  cPrivatekeys, cPublicKeys : Integer;
begin
  if Not OpenDialog.Execute then exit;
  ifn := OpenDialog.FileName;
  if Not FileExists(ifn) then raise Exception.Create(Format(rsWlltKeysbbImpKCFFileExcp,ifn)); // Cannot find file %s
  wki := TWalletKeys.Create(Self);
  try
    wki.WalletFileName := ifn;
    if wki.Count<=0 then raise Exception.Create(rsWlltKeysbbImpKCWlltFIvDta); // Wallet file has no valid data
    pwd := '';
    While (Not wki.IsValidPassword) do begin
      if Not InputQuery(rsWlltKeysbbImpKCInpQueryC,rsWlltKeysbbImpKCInpQueryE,pwd) then exit; // Import - Enter the wallet file password:
      wki.WalletPassword := pwd;
      if not wki.IsValidPassword then begin
        If Application.MessageBox(PChar(rsWlltKeysbbImpKCMBxPswNVld), // Password entered is not valid, retry?
                                  PChar(Application.Title),MB_ICONERROR+MB_YESNO)<>Idyes then exit;
      end;
    end;
    cPrivatekeys := 0;
    cPublicKeys := 0;
    if wki.IsValidPassword then begin
      for i := 0 to wki.Count - 1 do begin
        if WalletKeys.IndexOfAccountKey(wki.Key[i].AccountKey)<0 then begin
          If Assigned(wki.Key[i].PrivateKey) then begin
            WalletKeys.AddPrivateKey(wki.Key[i].Name,wki.Key[i].PrivateKey);
            inc(cPrivatekeys);
          end else begin
            WalletKeys.AddPublicKey(wki.Key[i].Name,wki.Key[i].AccountKey);
            inc(cPublicKeys);
          end;
        end;
      end;
    end;
    if (cPrivatekeys>0) Or (cPublicKeys>0) then begin
      Application.MessageBox(PChar(Format(rsWlltKeysWlltFileImpMsgBox,ifn,inttostr(wki.Count),IntToStr(cPrivatekeys),
                                          IntToStr(cPublicKeys),InttoStr(wki.Count - cPrivatekeys - cPublicKeys))), // Wallet file imported successfully#10#10File:%s#10#10Total keys in wallet: %sImported private keys: %s'+#10+'Imported public keys only: %s#10Duplicated (not imported): %s
        PChar(Application.Title),MB_OK+MB_ICONINFORMATION);
    end else begin
      Application.MessageBox(PChar(Format(rsWlltKeysWlltFleAlrdMsgBox,ifn,inttostr(wki.Count))), // Wallet file keys were already in your wallet. Nothing imported#10#10File: %s#10#10Total keys in wallet: %s
        PChar(Application.Title),MB_OK+MB_ICONWARNING);
    end;
  finally
    wki.Free;
  end;
end;

procedure TFRMWalletKeys.bbImportPrivateKeyClick(Sender: TObject);
var s : String;
 desenc, enc : AnsiString;
 EC : TECPrivateKey;
 i : Integer;
 wk : TWalletKey;
 parseResult : Boolean;

  function ParseRawKey(EC_OpenSSL_NID : Word) : boolean;
  begin
    FreeAndNil(EC); ParseRawKey := False;
    EC := TECPrivateKey.Create;
    Try
      EC.SetPrivateKeyFromHexa(EC_OpenSSL_NID, TCrypto.ToHexaString(enc));
      ParseRawKey := True;
    Except
      On E:Exception do begin
        FreeAndNil(EC);
        Raise;
      end;
    end;
  end;

  function ParseEncryptedKey : boolean;
  begin
      Repeat
        s := '';
        desenc := '';
        if InputQuery(rsWlltKeysbbImPKeyClkInpQrC,rsWlltKeysbbImPKeyClkInpQrE,s) then begin // Import private key - Enter the password:
          If (TAESComp.EVP_Decrypt_AES256(enc,s,desenc)) then begin
            if (desenc<>'') then begin
              EC := TECPrivateKey.ImportFromRaw(desenc);
              ParseEncryptedKey := True;
              Exit;
            end else begin
              if Application.MessageBox(PChar(rsWlltKeysbbImPKeyClkMsgBox),'',MB_RETRYCANCEL+MB_ICONERROR)<>IDRETRY then begin // Invalid password!
                ParseEncryptedKey := False;
                Exit;
              end;
              desenc := '';
            end;
          end else begin
            if Application.MessageBox(PChar(rsWlltKeysbbImPKeyClkMBxIPw),'',MB_RETRYCANCEL+MB_ICONERROR)<>IDRETRY then begin // Invalid password or corrupted data!
              ParseEncryptedKey := False;
              Exit;
            end;
          end;
        end else begin
          ParseEncryptedKey := false;
          Exit;
        end;
      Until (desenc<>'');
  end;

begin
  EC := Nil;
  CheckIsWalletKeyValidPassword;
  if Not Assigned(WalletKeys) then exit;
  if InputQuery(rsWlltKeysbbInpQryImpPvKeyC,rsWlltKeysbbInpQryImpPvKeyE,s) then begin // Import private key - Insert the password protected private key or raw private key
    s := trim(s);
    if (s='') then raise Exception.Create(rsWlltKeysbbNoValidKeyExcpt); // No valid key
    enc := TCrypto.HexaToRaw(s);
    if (enc='') then raise Exception.Create(rsWlltKeysbbInvalTextExcept); // Invalid text... You must enter an hexadecimal value ("0".."9" or "A".."F")
    case Length(enc) of
         32: parseResult := ParseRawKey(CT_NID_secp256k1);
         35,36: parseResult := ParseRawKey(CT_NID_sect283k1);
         48: parseResult := ParseRawKey(CT_NID_secp384r1);
         65,66: parseResult := ParseRawKey(CT_NID_secp521r1);
         64, 80, 96: parseResult := ParseEncryptedKey;
         else Exception.Create(rsWlltKeysbbInvdlyFmtPKExcp); // Invalidly formatted private key string. Ensure it is an encrypted private key export or raw private key hexstring.'
    end;
    if (parseResult = False) then
       exit;
    Try
      // EC is assigned by ParseRawKey/ImportEncryptedKey
      if Not Assigned(EC) then begin
        Application.MessageBox(PChar(rsWlltKeysbbInvPswCrrDtaMBx),'', MB_OK); // Invalid password and/or corrupted data!
        exit;
      end;
      i := WalletKeys.IndexOfAccountKey(EC.PublicKey);
      if (i>=0) then begin
        wk := WalletKeys.Key[i];
        if Assigned(wk.PrivateKey) And (Assigned(wk.PrivateKey.PrivateKey)) then raise Exception.Create(rsWlltKeysbbKeyAlrdyWlltExc); // This key is already in your wallet!
      end;
      s := Format(rsWlltKeysbbImportdDTimeStr,DateTimeToStr(now)); // Imported %s
      s := InputBox(rsWlltKeysbbSetANameInpBxC,rsWlltKeysbbSetANameInpBxE,s); // Set a name - Name for this private key:
      i := WalletKeys.AddPrivateKey(s,EC);
      Application.MessageBox(PChar(rsWlltKeysbbImportedPvtKey),PChar(Application.Title),MB_OK+MB_ICONINFORMATION); // Imported private key
    Finally
      EC.Free;
    End;
    UpdateWalletKeys;
  end;
end;

procedure TFRMWalletKeys.bbImportPublicKeyClick(Sender: TObject);
var s : String;
 raw : AnsiString;
 EC : TECPrivateKey;
 account : TAccountKey;
 errors : AnsiString;
begin
  CheckIsWalletKeyValidPassword;
  if Not Assigned(WalletKeys) then exit;
  if Not InputQuery(rsWlltKeysbbImpPubKeyInpQrC,rsWlltKeysbbImpPubKeyInpQrE,s) then exit; // Import publick key - Insert the public key in hexa format or imported format
  If not TAccountComp.AccountPublicKeyImport(s,account,errors) then begin
    raw := TCrypto.HexaToRaw(s);
    if trim(raw)='' then raise Exception.Create(Format(rsWlltKeysbbImpPubKeyIPKVEx,errors)); // Invalid public key value (Not hexa or not an imported format) #10%s
    account := TAccountComp.RawString2Accountkey(raw);
  end;
  If not TAccountComp.IsValidAccountKey(account,errors) then raise Exception.Create(Format(rsWlltKeysbbImpPubKeyDNVPEx,errors)); // This data is not a valid public key#10%s
  if WalletKeys.IndexOfAccountKey(account)>=0 then raise exception.Create(rsWlltKeysbbKeyAlrdExstWtEx,); // This key exists on your wallet
  s := Format(rsWlltKeysbbImportdPbKeyStr,DateTimeToStr(now)); // Imported public key %s
  if InputQuery(rsWlltKeysbbSetANameImpQryC,rsWlltKeysbbSetANameImpQryE,s) then begin // Set a name - Name for this private key:
    WalletKeys.AddPublicKey(s,account);
    UpdateWalletKeys;
    Application.MessageBox(PChar(rsWlltKeysbbImpPubKeyMsgBox),PChar(Application.Title),MB_OK+MB_ICONINFORMATION); // Imported public key
  end;
end;

procedure TFRMWalletKeys.bbLockClick(Sender: TObject);
begin
  FWalletKeys.LockWallet;
end;

procedure TFRMWalletKeys.bbUpdatePasswordClick(Sender: TObject);
Var s,s2 : String;
begin
  if FWalletKeys.IsValidPassword then begin
    s := ''; s2 := '';
    if Not InputQuery(rsWlltKeysbbUpDPwChgPwIQryC,rsWlltKeysbbUpDPwChgPwIQryE,s) then exit; // Change password - Enter new password
    if trim(s)<>s then raise Exception.Create(rsWlltKeysbbUpDPwPwCNSpcCEx); // Password cannot start or end with a space character
    if Not InputQuery(rsWlltKeysbbUpDPwCPwInpQryC,rsWlltKeysbbUpDPwCPwInpQryE,s2) then exit; // Change password - Enter new password again
    if s<>s2 then raise Exception.Create(rsWlltKeysbbUpDPw2PwDiffrEx); // Two passwords are different!

    FWalletKeys.WalletPassword := s;
    Application.MessageBox(PChar(Format(rsWlltKeysbbUpDPwChgdMsgBox,s)), // Password changed!#10#10Please note that your new password is "%s"#10#10(If you lose this password, you will lose your wallet forever!)
                           PChar(Application.Title),MB_ICONWARNING+MB_OK);
    UpdateWalletKeys;
  end else begin
    s := '';
    Repeat
      if Not InputQuery(rsWlltKeysbbUpDWltPwInpQryC,rsWlltKeysbbUpDWltPwInpQryE,s) then exit; // Wallet password - Enter wallet password
      FWalletKeys.WalletPassword := s;
      if Not FWalletKeys.IsValidPassword then Application.MessageBox(PChar(rsWlltKeysbbUpDInvPwMsgBox),PChar(Application.Title),MB_ICONERROR+MB_OK); // Invalid password
    Until FWalletKeys.IsValidPassword;
    UpdateWalletKeys;
  end;
end;

procedure TFRMWalletKeys.CheckIsWalletKeyValidPassword;
begin
  if Not Assigned(FWalletKeys) then exit;

  if Not FWalletKeys.IsValidPassword then begin
    Application.MessageBox(PChar(rsWlltKeysChkWKeyVPwMsgBox), // Wallet key is encrypted!#10#10You must enter password to continue...
      PCHar(Application.Title),MB_OK+MB_ICONWARNING);
    bbUpdatePasswordClick(Nil);
    if Not FWalletKeys.IsValidPassword then raise Exception.Create(rsWlltKeysChkWKeyVPwExcept); // Cannot continue without valid password
  end;
end;

procedure TFRMWalletKeys.CM_WalletChanged(var Msg: TMessage);
begin
  UpdateWalletKeys;
end;

destructor TFRMWalletKeys.Destroy;
begin
  if Assigned(FWalletKeys) then FWalletKeys.OnChanged.Remove(OnWalletKeysChanged);
  inherited;
end;

procedure TFRMWalletKeys.FormCreate(Sender: TObject);
begin
  lbWalletKeys.Sorted := true;
  FWalletKeys := Nil;
  UpdateWalletKeys;
end;

function TFRMWalletKeys.GetSelectedWalletKey(var WalletKey: TWalletKey): Boolean;
Var i : Integer;
begin
  Result := GetSelectedWalletKeyAndIndex(WalletKey,i);
end;

function TFRMWalletKeys.GetSelectedWalletKeyAndIndex(var WalletKey: TWalletKey; var index: Integer): Boolean;
begin
  index := -1;
  Result := false;
  if Not Assigned(WalletKeys) then exit;
  if lbWalletKeys.ItemIndex<0 then exit;
  index := Integer(lbWalletKeys.Items.Objects[ lbWalletKeys.ItemIndex ]);
  if (index>=0) And (index<WalletKeys.Count) then begin
    WalletKey := WalletKeys.Key[index];
    Result := true;
  end;
end;

procedure TFRMWalletKeys.lbWalletKeysClick(Sender: TObject);
begin
  UpdateSelectedWalletKey;
end;

procedure TFRMWalletKeys.OnWalletKeysChanged(Sender : TObject);
begin
  PostMessage(Self.Handle,CM_PC_WalletKeysChanged,0,0);
  //if Assigned(FOldOnChanged) then FOldOnChanged(Sender);   XXXXX HS 2017-09-07: is this procedure needed anymore?
end;

procedure TFRMWalletKeys.SetWalletKeys(const Value: TWalletKeys);
begin
  if FWalletKeys=Value then exit;
  if Assigned(FWalletKeys) then FWalletKeys.OnChanged.Remove(OnWalletKeysChanged);
  FWalletKeys := Value;
  if Assigned(FWalletKeys) then begin
    FWalletKeys.OnChanged.Add(OnWalletKeysChanged);
  end;
  UpdateWalletKeys;
end;

procedure TFRMWalletKeys.UpdateSelectedWalletKey;
Var
  wk : TWalletKey;
  ok : Boolean;
begin
  ok := false;
  wk := CT_TWalletKey_NUL;
  try
    if Not GetSelectedWalletKey(wk) then exit;
    ok := true;
    lblEncryptionType.Caption := TAccountComp.GetECInfoTxt( wk.AccountKey.EC_OpenSSL_NID );
    if wk.Name='' then lblKeyName.Caption := rsWlltKeysUpDSelWKlblKName;
    else lblKeyName.Caption := wk.Name;
    if Assigned(wk.PrivateKey) then begin
      memoPrivateKey.Lines.Text :=  TCrypto.PrivateKey2Hexa(wk.PrivateKey.PrivateKey);
      memoPrivateKey.Font.Color := clBlack;
    end else begin
      memoPrivateKey.Lines.Text := rsWlltKeysUpDSelWKMemoPKTxt; // (No private key)
      memoPrivateKey.Font.Color := clRed;
    end;
  finally
    lblEncryptionTypeCaption.Enabled := ok;
    lblEncryptionType.Enabled := ok;
    lblKeyNameCaption.Enabled := ok;
    lblKeyName.Enabled := (ok) And (wk.Name<>'');
    lblPrivateKeyCaption.Enabled := ok;
    memoPrivateKey.Enabled := ok;
    bbExportPrivateKey.Enabled := ok;
    bbExportPublicKey.Enabled := ok;
    bbChangeName.Enabled := ok;
    lblPrivateKeyCaption2.Enabled := ok;
    bbDelete.Enabled := ok;
    if not ok then begin
      lblEncryptionType.Caption := '';
      lblKeyName.Caption := '';
      memoPrivateKey.Lines.Clear;
    end;
  end;

end;

procedure TFRMWalletKeys.UpdateWalletKeys;
Var lasti,i : Integer;
  selected_wk,wk : TWalletKey;
  s : AnsiString;
begin
  GetSelectedWalletKeyAndIndex(wk,lasti);
  lbWalletKeys.Items.BeginUpdate;
  Try
    lbWalletKeys.Items.Clear;
    lblKeysEncrypted.Caption := '';
    if not assigned(FWalletKeys) then exit;
    bbLock.Enabled := (FWalletKeys.IsValidPassword) And (FWalletKeys.WalletPassword<>'');
    If FWalletKeys.IsValidPassword then begin
      if FWalletKeys.WalletPassword='' then lblKeysEncrypted.Caption := rsWlltKeysUpDWKlblKEncWtoPw; // Wallet without password
      else lblKeysEncrypted.Caption := rsWlltKeysUpDWKlblKEncPwPrd; // Wallet is password protected
      lblKeysEncrypted.font.Color := clGreen;
      bbUpdatePassword.Caption := rsWlltKeysUpDWKlblUpdPwCgPw; // Change password
    end else begin
      lblKeysEncrypted.Caption := rsWlltKeysUpDWKlblKEncWlEnc; // Wallet is encrypted... need password!
      lblKeysEncrypted.font.Color := clRed;
      bbUpdatePassword.Caption := rsWlltKeysUpDWKlblUpdPwIPw; // Input password
    end;
    for i := 0 to WalletKeys.Count - 1 do begin
      wk := WalletKeys.Key[i];
      if (wk.Name='') then begin
        s := 'Sha256='+TCrypto.ToHexaString( TCrypto.DoSha256( TAccountComp.AccountKey2RawString(wk.AccountKey) ) );
      end else begin
        s := wk.Name;
      end;
      if Not Assigned(wk.PrivateKey) then begin
        if wk.CryptedKey<>'' then s:= s + Format(rsWlltKeysUpDWKEncrpNeedPsw,s); // %s (Encrypted, need password)
        s:= s + rsWlltKeysUpDWKWithoutKey; //  (* without key);
      end;
      lbWalletKeys.Items.AddObject(s,TObject(i));
    end;
    i := lbWalletKeys.Items.IndexOfObject(TObject(lasti));
    lbWalletKeys.ItemIndex := i;
  Finally
    lbWalletKeys.Items.EndUpdate;
  End;
  UpdateSelectedWalletKey;
end;

end.
