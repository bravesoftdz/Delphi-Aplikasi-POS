unit Ulogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls;

type
  TFlogin = class(TForm)
    BitBtn2: TBitBtn;
    Button1: TButton;
    Edusername: TEdit;
    Edpassword: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Flogin: TFlogin;

implementation

{$R *.dfm}

uses UDM, MyFunction;

procedure TFlogin.BitBtn2Click(Sender: TObject);
begin
  cNamaUser := Trim(EdUserName.Text);
  cPassSHA1 := getmd5(Edpassword.Text);

  with dm.Qtemp do
  begin
    sql.Clear;
    sql.Add('select * from tuser where user='+QuotedStr(EdUserName.Text));
    sql.Add('and password='+QuotedStr(cPassSHA1));
    Open;
  end;
  if dm.Qtemp.RecordCount > 0 then
  begin
   HakAkses:=dm.Qtemp.fieldbyname('hak_akses').AsString;
   PIC:=dm.Qtemp.fieldbyname('user').AsString;
   cUser_id := dm.Qtemp.fieldbyname('id').AsString;
   FLogin.Close;
  end
    else
        Begin
          MessageDlg('User / password salah, silahkan coba lagi',mtWarning,[mbok],0);
          EdUserName.Clear;
          EdPassword.Clear;
          EdUserName.SetFocus;
        End;
end;

procedure TFlogin.Button1Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
