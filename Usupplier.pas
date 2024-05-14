unit Usupplier;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TFtambah_edit_supplier = class(TForm)
    Panel1: TPanel;
    btcancel: TBitBtn;
    btsimpan: TBitBtn;
    Splitter1: TSplitter;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edkodesupplier: TEdit;
    Ednamasupplier: TEdit;
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
  Ftambah_edit_supplier: TFtambah_edit_supplier;

implementation

{$R *.dfm}

uses MyFunction, UDM, Ulistsupplier;

procedure TFtambah_edit_supplier.btcancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFtambah_edit_supplier.btsimpanClick(Sender: TObject);
begin
 if Edkodesupplier.Text='' then
 begin
   Messagedlg('Kode supplier Tidak Boleh Kosong',mtWarning,[Mbok],0);
   Exit;
 end;
 if Ednamasupplier.Text='' then
 begin
   Messagedlg('Nama supplier Tidak Boleh Kosong',mtWarning,[Mbok],0);
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
    SQL.Text:='INSERT INTO pos.tsupplier(kode_supplier,nama_supplier,alamat,'+
        'no_telp)VALUES('+
        QuotedStr(Edkodesupplier.Text)+','+
        QuotedStr(Ednamasupplier.Text)+','+
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
    SQL.Text:='UPDATE pos.tsupplier SET '+
        'nama_supplier= '+QuotedStr(Ednamasupplier.Text)+','+
        'alamat= '+QuotedStr(Memoalamat.Text)+','+
        'no_telp= '+QuotedStr(Ednotelp.Text)+
        ' WHERE kode_supplier= '+QuotedStr(Edkodesupplier.Text);
    Execute;
  end;
   Messagedlg('Ubah Data Berhasil',MtInformation,[Mbok],0);
 end;
  Flistsupplier.btrefreshClick(Sender);
  Close;
end;

end.
