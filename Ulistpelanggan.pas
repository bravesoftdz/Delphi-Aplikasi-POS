unit Ulistpelanggan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Data.DB, DBAccess, Uni, MemDS;

type
  TFlistpelanggan = class(TForm)
    Panel1: TPanel;
    bttambah: TBitBtn;
    Splitter1: TSplitter;
    btedit: TBitBtn;
    Splitter2: TSplitter;
    bthapus: TBitBtn;
    Splitter3: TSplitter;
    btrefresh: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    Splitter4: TSplitter;
    Splitter5: TSplitter;
    Edcari: TEdit;
    DBGrid1: TDBGrid;
    Qpelanggan: TUniQuery;
    DSpelanggan: TUniDataSource;
    Qpelangganid: TIntegerField;
    Qpelanggankode_pelanggan: TStringField;
    Qpelanggannama_pelanggan: TStringField;
    Qpelangganalamat: TMemoField;
    Qpelangganno_telp: TStringField;
    procedure bttambahClick(Sender: TObject);
    procedure btrefreshClick(Sender: TObject);
    procedure bteditClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure bthapusClick(Sender: TObject);
    procedure EdcariChange(Sender: TObject);
    procedure QpelangganalamatGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Flistpelanggan: TFlistpelanggan;

implementation

{$R *.dfm}

uses MyFunction, UDM, Upelanggan;

procedure TFlistpelanggan.bteditClick(Sender: TObject);
begin
  Application.CreateForm(TFtambah_edit_pelanggan,Ftambah_edit_pelanggan);
  status_simpan := 2;
  Ftambah_edit_pelanggan.Edkodepelanggan.Text := Qpelanggankode_pelanggan.AsString;
  Ftambah_edit_pelanggan.Ednamapelanggan.Text := Qpelanggannama_pelanggan.AsString;
  Ftambah_edit_pelanggan.Ednotelp.Text := Qpelangganno_telp.AsString;
  Ftambah_edit_pelanggan.Memoalamat.Text := Qpelangganalamat.AsString;
  Ftambah_edit_pelanggan.ShowModal;
  Ftambah_edit_pelanggan.Free;
end;

procedure TFlistpelanggan.bthapusClick(Sender: TObject);
begin
  if Application.MessageBox('Apakah anda yakin ingin menghapus data yang dipilih',
  'konfirmasi',
  MB_YESNO or MB_ICONINFORMATION)=idyes then
  begin
    with dm.Qtemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='DELETE FROM pos.tpelanggan '+
         ' WHERE kode_pelanggan= '+QuotedStr(Qpelanggankode_pelanggan.AsString);
      Execute;
    end;
    btrefreshClick(Sender);
  end;
end;

procedure TFlistpelanggan.btrefreshClick(Sender: TObject);
begin
  Edcari.Clear;
  Qpelanggan.MacroByName('WHERE').Value:='';
  if Qpelanggan.Active then
    Qpelanggan.Refresh
  else
    Qpelanggan.Open;
end;

procedure TFlistpelanggan.bttambahClick(Sender: TObject);
begin
  Application.CreateForm(TFtambah_edit_pelanggan,Ftambah_edit_pelanggan);
  status_simpan := 1;
  Ftambah_edit_pelanggan.Edkodepelanggan.Text := Autokode('kode_pelanggan','tpelanggan','PL');
  Ftambah_edit_pelanggan.ShowModal;
  Ftambah_edit_pelanggan.Free;
end;

procedure TFlistpelanggan.DBGrid1DblClick(Sender: TObject);
begin
 bteditClick(Sender);
end;

procedure TFlistpelanggan.EdcariChange(Sender: TObject);
begin
  Qpelanggan.MacroByName('WHERE').Value:= 'WHERE kode_pelanggan LIKE '+QuotedStr('%'+Edcari.Text+'%')+
    ' OR nama_pelanggan LIKE '+QuotedStr('%'+Edcari.Text+'%');
  if Qpelanggan.Active then
    Qpelanggan.Refresh
  else
    Qpelanggan.Open;
  end;

procedure TFlistpelanggan.FormShow(Sender: TObject);
begin
  btrefreshClick(Sender);
end;

procedure TFlistpelanggan.QpelangganalamatGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Text := Copy(Qpelangganalamat.AsString, 1, 50);
end;

end.
