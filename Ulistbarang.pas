unit Ulistbarang;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Data.DB, DBAccess, Uni, MemDS;

type
  TFBarang = class(TForm)
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
    QBarang: TUniQuery;
    DSBarang: TUniDataSource;
    QBarangid: TIntegerField;
    QBarangkode_barang: TStringField;
    QBarangnama_barang: TStringField;
    QBarangdeskripsi: TStringField;
    QBarangsatuan: TStringField;
    QBarangstokawal: TFloatField;
    QBarangstokmin: TFloatField;
    QBaranghargajual: TFloatField;
    QBarangflg_aktif: TSmallintField;
    QBarangstok_awal: TFloatField;
    QBarangstok_masuk: TFloatField;
    QBarangstok_keluar: TFloatField;
    QBarangstok_akhir: TFloatField;
    procedure bttambahClick(Sender: TObject);
    procedure btrefreshClick(Sender: TObject);
    procedure bteditClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure bthapusClick(Sender: TObject);
    procedure EdcariChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBarang: TFBarang;

implementation

{$R *.dfm}

uses MyFunction, UDM, UBarang;

procedure TFBarang.bteditClick(Sender: TObject);
begin
  Application.CreateForm(TFtambah_edit_barang,Ftambah_edit_barang);
  status_simpan := 2;
  Ftambah_edit_barang.Edkodebarang.Text := QBarangkode_barang.AsString;
  Ftambah_edit_barang.Ednamabarang.Text := QBarangnama_barang.AsString;
  Ftambah_edit_barang.Eddeskripsi.Text := QBarangdeskripsi.AsString;
  Ftambah_edit_barang.cbsatuan.Text := QBarangsatuan.AsString;
  Ftambah_edit_barang.Edstokawal.Text := FloatToStr(QBarangstokawal.AsFloat);
  Ftambah_edit_barang.Edstokmin.Text := FloatToStr(QBarangstokmin.AsFloat);
  Ftambah_edit_barang.Edhargajual.Text := FloatToStr(QBaranghargajual.AsFloat);
  Cflg_aktif := QBarangflg_aktif.AsInteger;
  Ftambah_edit_barang.ShowModal;
  Ftambah_edit_barang.Free;
end;

procedure TFBarang.bthapusClick(Sender: TObject);
begin
  if Application.MessageBox('Apakah anda yakin ingin menghapus data yang dipilih',
  'konfirmasi',
  MB_YESNO or MB_ICONINFORMATION)=idyes then
  begin
    with dm.Qtemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='DELETE FROM pos.tbarang '+
         ' WHERE kode_barang= '+QuotedStr(QBarangkode_barang.AsString);
      Execute;
    end;
    btrefreshClick(Sender);
  end;
end;

procedure TFBarang.btrefreshClick(Sender: TObject);
begin
  Edcari.Clear;
  QBarang.MacroByName('WHERE').Value:='';
  if QBarang.Active then
    QBarang.Refresh
  else
    QBarang.Open;
end;

procedure TFBarang.bttambahClick(Sender: TObject);
begin
  Application.CreateForm(TFtambah_edit_barang,Ftambah_edit_barang);
  status_simpan := 1;
  Cflg_aktif := 0;
  Ftambah_edit_barang.Edkodebarang.Text := Autokode('kode_barang','tbarang','BR');
  Ftambah_edit_barang.ShowModal;
  Ftambah_edit_barang.Free;
end;

procedure TFBarang.DBGrid1DblClick(Sender: TObject);
begin
 bteditClick(Sender);
end;

procedure TFBarang.EdcariChange(Sender: TObject);
begin
  QBarang.MacroByName('WHERE').Value:= 'WHERE tb.kode_barang LIKE '+QuotedStr('%'+Edcari.Text+'%')+
    ' OR tb.nama_barang LIKE '+QuotedStr('%'+Edcari.Text+'%');
  if QBarang.Active then
    QBarang.Refresh
  else
    QBarang.Open;
  end;

procedure TFBarang.FormShow(Sender: TObject);
begin
  btrefreshClick(Sender);
end;

end.
