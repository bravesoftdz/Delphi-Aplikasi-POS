unit MyFunction;

interface
uses SysUtils,Variants,Forms,Windows,Controls, StdCtrls, ComCtrls,
    Messages,Classes,Dialogs,Graphics,frxClass, IdHashMessageDigest, idHash,
    DateUtils, UDM;

function getmd5(SourceString: string): string;
function Autokode(Kolom,Tabel,KodeAwal : string): string;


var
cNamaUser, cAkses, cPassSHA1, cPass, HakAkses, PIC, cUser_id,
kode, tahun, bulan : string;
urut, Cflg_aktif, status_simpan :integer;
//status_simpan=1 insert
//status_simpan=2 edit

implementation

function Autokode(Kolom,Tabel,KodeAwal : string): string;
begin
  with dm.Qtemp do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='select '+Kolom+' from '+Tabel+' ';
    Open;
  end;
  if dm.Qtemp.RecordCount = 0 then urut :=1 else
  if dm.Qtemp.RecordCount > 0 then
  begin
    with Dm.Qtemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='select max(right('+Kolom+',4)) as kode from '+Tabel+' ';
      Open;
    end;
    urut:=dm.Qtemp.FieldByName('kode').AsInteger +1;
  end;
  kode:=inttostr(urut);
  kode:=KodeAwal+Copy('000'+kode,length('000'+kode)-4,5);
  Result := kode;
end;

(* function read html5*)
function getmd5(SourceString: string): string;
  var
    md5: TIdHashMessageDigest5;
begin
  result := '';
  md5 := TIdHashMessageDigest5.Create;
  try
    result := AnsiLowerCase(md5.HashStringAsHex(SourceString));
  finally
    FreeAndNil(md5);
  end;
end;

end.
