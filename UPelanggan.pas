unit UPelanggan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TFtambah_edit_pelanggan = class(TForm)
    Panel1: TPanel;
    btcancel: TBitBtn;
    btsimpan: TBitBtn;
    Splitter1: TSplitter;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edkodepelanggan: TEdit;
    Ednamapelanggan: TEdit;
    Ednotelp: TEdit;
    Label4: TLabel;
    Memoalamat: TMemo;
    procedure btsimpanClick(Sender: TObject);
    procedure btcancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Ftambah_edit_pelanggan: TFtambah_edit_pelanggan;

implementation

{$R *.dfm}

uses MyFunction, UDM, Ulistpelanggan;

procedure TFtambah_edit_pelanggan.btcancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFtambah_edit_pelanggan.btsimpanClick(Sender: TObject);
begin
 if Edkodepelanggan.Text='' then
 begin
   Messagedlg('Kode Pelanggan Tidak Boleh Kosong',mtWarning,[Mbok],0);
   Exit;
 end;
 if Ednamapelanggan.Text='' then
 begin
   Messagedlg('Nama Pelanggan Tidak Boleh Kosong',mtWarning,[Mbok],0);
   Exit;
 end;
 if Ednotelp.Text='' then
 begin
   Messagedlg('No Telp Tidak Boleh Kosong',mtWarning,[Mbok],0);
   Exit;
 end;
 //Tambah
 if status_simpan=1 then
 begin
  with dm.Qtemp do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='INSERT INTO pos.tpelanggan(kode_pelanggan,nama_pelanggan,alamat,'+
        'no_telp)VALUES('+
        QuotedStr(Edkodepelanggan.Text)+','+
        QuotedStr(Ednamapelanggan.Text)+','+
        QuotedStr(Memoalamat.Text)+','+
        QuotedStr(Ednotelp.Text)+')';
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
    SQL.Text:='UPDATE pos.tpelanggan SET '+
        'nama_pelanggan= '+QuotedStr(Ednamapelanggan.Text)+','+
        'alamat= '+QuotedStr(Memoalamat.Text)+','+
        'no_telp= '+QuotedStr(Ednotelp.Text)+
        ' WHERE kode_pelanggan= '+QuotedStr(Edkodepelanggan.Text);
    Execute;
  end;
   Messagedlg('Ubah Data Berhasil',MtInformation,[Mbok],0);
 end;
  Flistpelanggan.btrefreshClick(Sender);
  Close;
end;

end.
