unit UBarang;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TFtambah_edit_barang = class(TForm)
    Panel1: TPanel;
    btcancel: TBitBtn;
    btsimpan: TBitBtn;
    Splitter1: TSplitter;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Chflg_aktif: TCheckBox;
    Edkodebarang: TEdit;
    Ednamabarang: TEdit;
    Eddeskripsi: TEdit;
    cbsatuan: TComboBox;
    Edstokawal: TEdit;
    Edstokmin: TEdit;
    Edhargajual: TEdit;
    procedure btsimpanClick(Sender: TObject);
    procedure btcancelClick(Sender: TObject);
    procedure Chflg_aktifClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Ftambah_edit_barang: TFtambah_edit_barang;

implementation

{$R *.dfm}

uses MyFunction, UDM, Ulistbarang;

procedure TFtambah_edit_barang.btcancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFtambah_edit_barang.btsimpanClick(Sender: TObject);
begin
 if Edkodebarang.Text='' then
 begin
   Messagedlg('Kode Barang Tidak Boleh Kosong',mtWarning,[Mbok],0);
   Exit;
 end;
 if Ednamabarang.Text='' then
 begin
   Messagedlg('Nama Barang Tidak Boleh Kosong',mtWarning,[Mbok],0);
   Exit;
 end;
 if Eddeskripsi.Text='' then
 begin
   Messagedlg('Deskripsi Barang Tidak Boleh Kosong',mtWarning,[Mbok],0);
   Exit;
 end;
 //Tambah
 if status_simpan=1 then
 begin
  with dm.Qtemp do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='INSERT INTO pos.tbarang(kode_barang,nama_barang,deskripsi,'+
        'satuan,stok_awal,stok_min,harga_jual,flg_aktif)VALUES('+
        QuotedStr(Edkodebarang.Text)+','+
        QuotedStr(Ednamabarang.Text)+','+
        QuotedStr(Eddeskripsi.Text)+','+
        QuotedStr(cbsatuan.Text)+','+
        QuotedStr(Edstokawal.Text)+','+
        QuotedStr(Edstokmin.Text)+','+
        QuotedStr(Edhargajual.Text)+','+
        IntToStr(Cflg_aktif)+')';
    Execute;
  end;
   Messagedlg('Tambah Data Berhasil',MtInformation,[Mbok],0);
 end;
 //edit
 if status_simpan=2 then
 begin
  with dm.Qtemp do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='UPDATE pos.tbarang SET '+
        'nama_barang= '+QuotedStr(Ednamabarang.Text)+','+
        'deskripsi= '+QuotedStr(Eddeskripsi.Text)+','+
        'satuan= '+QuotedStr(cbsatuan.Text)+','+
        'stok_awal= '+QuotedStr(Edstokawal.Text)+','+
        'stok_min= '+QuotedStr(Edstokmin.Text)+','+
        'harga_jual= '+QuotedStr(Edhargajual.Text)+','+
        'flg_aktif= '+IntToStr(Cflg_aktif)+
        ' WHERE kode_barang= '+QuotedStr(Edkodebarang.Text);
    Execute;
  end;
   Messagedlg('Ubah Data Berhasil',MtInformation,[Mbok],0);
 end;
  FBarang.btrefreshClick(Sender);
  Close;
end;

procedure TFtambah_edit_barang.Chflg_aktifClick(Sender: TObject);
begin
  if Chflg_aktif.Checked then
    Cflg_aktif :=1
  else
    Cflg_aktif :=0;
end;

procedure TFtambah_edit_barang.FormShow(Sender: TObject);
begin
 if Cflg_aktif=1 then
    Chflg_aktif.Checked:=True
 else
    Chflg_aktif.Checked:=False;
end;

end.
