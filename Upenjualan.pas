unit Upenjualan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ComCtrls, Data.DB, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, Vcl.Menus;

type
  TFtambah_edit_penjualan = class(TForm)
    Panel1: TPanel;
    btcancel: TBitBtn;
    btsimpan: TBitBtn;
    Splitter1: TSplitter;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edkodepelanggan: TEdit;
    Ednobukti: TEdit;
    Label4: TLabel;
    Dtpenjualan: TDateTimePicker;
    Label5: TLabel;
    Edkodepenjualan: TEdit;
    Panel2: TPanel;
    CDS1: TClientDataSet;
    DBGrid1: TDBGrid;
    Dscds1: TDataSource;
    cbnama_pelanggan: TComboBox;
    PopupMenu1: TPopupMenu;
    Insert1: TMenuItem;
    Edit1: TMenuItem;
    Delete1: TMenuItem;
    CDS1kode_barang: TStringField;
    CDS1nama_barang: TStringField;
    CDS1satuan: TStringField;
    CDS1harga_jual: TFloatField;
    CDS1qty: TFloatField;
    CDS1sub_total: TFloatField;
    Panel3: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Edtotal: TEdit;
    Edbayar: TEdit;
    Edkembali: TEdit;
    procedure btsimpanClick(Sender: TObject);
    procedure btcancelClick(Sender: TObject);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure cbnama_pelangganDropDown(Sender: TObject);
    procedure cbnama_pelangganChange(Sender: TObject);
    procedure Insert1Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure DBGrid1Exit(Sender: TObject);
    procedure CDS1AfterPost(DataSet: TDataSet);
    procedure EdbayarChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Ftambah_edit_penjualan: TFtambah_edit_penjualan;

implementation

{$R *.dfm}

uses MyFunction, UDM, Ulistpenjualan;

procedure TFtambah_edit_penjualan.btcancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFtambah_edit_penjualan.btsimpanClick(Sender: TObject);
begin
  if Edkodepenjualan.Text='' then
 begin
   Messagedlg('Kode Penjualan Tidak Boleh Kosong',mtWarning,[Mbok],0);
   Exit;
 end;
 if cbnama_pelanggan.Text='' then
 begin
   Messagedlg('Nama Pelanggan Tidak Boleh Kosong',mtWarning,[Mbok],0);
   Exit;
 end;
 if Edkodepelanggan.Text='' then
 begin
   Messagedlg('Kode Pelanggan Tidak Boleh Kosong',mtWarning,[Mbok],0);
   Exit;
 end;
 if Ednobukti.Text='' then
 begin
   Messagedlg('No Telp Tidak Boleh Kosong',mtWarning,[Mbok],0);
   Exit;
 end;
 if CDS1.RecordCount=0 then
 begin
   Messagedlg('Data Detail Masih Kosong',mtWarning,[Mbok],0);
   Exit;
 end;
 //Tambah
 if status_simpan=1 then
 begin
  //master
  with dm.Qtemp do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='INSERT INTO pos.tpenjualan_master(kode_penjualan, '+
              'tgl_penjualan,kode_pelanggan,no_bukti,total,bayar,kembali) VALUES('+
        QuotedStr(Edkodepenjualan.Text)+','+
        QuotedStr(FormatDateTime('yyyy-mm-dd',Dtpenjualan.DateTime))+','+
        QuotedStr(Edkodepelanggan.Text)+','+
        QuotedStr(Ednobukti.Text)+','+
        QuotedStr(Edtotal.Text)+','+
        QuotedStr(Edbayar.Text)+','+
        QuotedStr(Edkembali.Text)+')';
    Execute;
  end;
  //Detail
  CDS1.First;
  while not CDS1.Eof do
  begin
    with dm.Qtemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='INSERT INTO pos.tpenjualan_detail(kode_penjualan,'+
                'kode_barang,qty,harga_jual,sub_total) VALUES('+
          QuotedStr(Edkodepenjualan.Text)+','+
          QuotedStr(CDS1kode_barang.Text)+','+
          FloatToStr(CDS1qty.Value)+','+
          FloatToStr(CDS1harga_jual.Value)+','+
          FloatToStr(CDS1sub_total.Value)+')';
      Execute;
      CDS1.Next;
    end;
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
    SQL.Text:='UPDATE pos.tpenjualan_master SET '+
        'tgl_penjualan='+QuotedStr(FormatDateTime('yyyy-mm-dd',Dtpenjualan.DateTime))+','+
        'kode_pelanggan= '+QuotedStr(Edkodepelanggan.Text)+','+
        'no_bukti= '+QuotedStr(Ednobukti.Text)+','+
        'total= '+QuotedStr(Edtotal.Text)+','+
        'bayar= '+QuotedStr(Edbayar.Text)+','+
        'kembali= '+QuotedStr(Edkembali.Text)+
        ' WHERE kode_penjualan= '+QuotedStr(Edkodepenjualan.Text);
    Execute;
  end;
  //DETAIL
    with dm.Qtemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='DELETE FROM pos.tpenjualan_detail '+
         ' WHERE kode_penjualan= '+QuotedStr(Edkodepenjualan.Text);
      Execute;
    end;
  //Detail
  CDS1.First;
  while not CDS1.Eof do
  begin
    with dm.Qtemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='INSERT INTO pos.tpenjualan_detail(kode_penjualan,'+
                'kode_barang,qty,harga_jual,sub_total) VALUES('+
          QuotedStr(Edkodepenjualan.Text)+','+
          QuotedStr(CDS1kode_barang.Text)+','+
          FloatToStr(CDS1qty.Value)+','+
          FloatToStr(CDS1harga_jual.Value)+','+
          FloatToStr(CDS1sub_total.Value)+')';
      Execute;
      CDS1.Next;
    end;
  end;
   Messagedlg('Ubah Data Berhasil',MtInformation,[Mbok],0);
 end;
  Flistpenjualan.btrefreshClick(Sender);
  Close;
end;

procedure TFtambah_edit_penjualan.cbnama_pelangganChange(Sender: TObject);
begin
   with dm.Qtemp do
    begin
       SQL.Clear;
       sql.Text := 'select kode_pelanggan from tpelanggan where nama_pelanggan='+
       QuotedStr(cbnama_pelanggan.Text);
       Open;
      Edkodepelanggan.Text:=FieldByName('kode_pelanggan').AsString;
    end;
end;

procedure TFtambah_edit_penjualan.cbnama_pelangganDropDown(Sender: TObject);
begin
   with dm.Qtemp do
    begin
       SQL.Clear;
       sql.Text := 'select nama_pelanggan from tpelanggan';
       Open;
      cbnama_pelanggan.Clear;
      dm.Qtemp.First;
      while not dm.Qtemp.Eof do
      begin
        cbnama_pelanggan.Items.Add(dm.Qtemp.FieldByName('nama_pelanggan').AsString);
        dm.Qtemp.Next;
      end;
    end;
end;

procedure TFtambah_edit_penjualan.CDS1AfterPost(DataSet: TDataSet);
begin
  Edtotal.Clear;
 CDS1.First;
 while not CDS1.Eof do
 begin
  Edtotal.Text := FloatToStr(StrToFloatDef(Edtotal.Text,0)+CDS1sub_total.Value);
  CDS1.Next;
 end;
end;

procedure TFtambah_edit_penjualan.DBGrid1ColExit(Sender: TObject);
begin
  if (CDS1.State in [dsInsert, dsEdit]) and (CDS1kode_barang.Text<>'') then
  begin
    with dm.Qtemp1 do
    begin
       SQL.Clear;
       sql.Text := 'select nama_barang,satuan from tbarang where kode_barang='+QuotedStr(CDS1kode_barang.Text);
       Open;
       if RecordCount=0 then
       Begin
         Messagedlg('Kode Barang Tidak ditemukan',mtWarning,[Mbok],0);
          Exit;
       End;
       CDS1nama_barang.Text := FieldByName('nama_barang').AsString;
       CDS1satuan.Text := FieldByName('satuan').AsString;
    end;
    if (CDS1qty.Value<>0) or (CDS1harga_jual.Value<>0) then
      CDS1sub_total.Value := CDS1qty.Value * CDS1harga_jual.Value;
    CDS1.Post;
  end;
end;

procedure TFtambah_edit_penjualan.DBGrid1Exit(Sender: TObject);
begin
 Edtotal.Clear;
 CDS1.First;
 while not CDS1.Eof do
 begin
  Edtotal.Text := FloatToStr(StrToFloatDef(Edtotal.Text,0)+CDS1sub_total.Value);
  CDS1.Next;
 end;
end;

procedure TFtambah_edit_penjualan.Delete1Click(Sender: TObject);
begin
 if CDS1.RecordCount > 0 then
  CDS1.Delete;
end;

procedure TFtambah_edit_penjualan.EdbayarChange(Sender: TObject);
begin
 Edkembali.Text := FloatToStr(StrToFloatDef(Edbayar.Text,0) - StrToFloatDef(Edtotal.Text,0));
end;

procedure TFtambah_edit_penjualan.Edit1Click(Sender: TObject);
begin
  CDS1.Edit;
end;

procedure TFtambah_edit_penjualan.Insert1Click(Sender: TObject);
begin
 CDS1.Insert;
end;

end.
