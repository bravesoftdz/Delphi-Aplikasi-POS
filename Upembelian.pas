unit Upembelian;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ComCtrls, Data.DB, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, Vcl.Menus;

type
  TFtambah_edit_pembelian = class(TForm)
    Panel1: TPanel;
    btcancel: TBitBtn;
    btsimpan: TBitBtn;
    Splitter1: TSplitter;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edkodesupplier: TEdit;
    Ednobukti: TEdit;
    Label4: TLabel;
    Dtpembelian: TDateTimePicker;
    Label5: TLabel;
    Edkodepembelian: TEdit;
    Panel2: TPanel;
    CDS1: TClientDataSet;
    CDS1kode_barang: TStringField;
    CDS1nama_barang: TStringField;
    CDS1satuan: TStringField;
    CDS1harga_beli: TFloatField;
    CDS1qty: TFloatField;
    CDS1sub_total: TFloatField;
    DBGrid1: TDBGrid;
    Dscds1: TDataSource;
    cbnama_supplier: TComboBox;
    PopupMenu1: TPopupMenu;
    Insert1: TMenuItem;
    Edit1: TMenuItem;
    Delete1: TMenuItem;
    procedure btsimpanClick(Sender: TObject);
    procedure btcancelClick(Sender: TObject);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure cbnama_supplierDropDown(Sender: TObject);
    procedure cbnama_supplierChange(Sender: TObject);
    procedure Insert1Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Ftambah_edit_pembelian: TFtambah_edit_pembelian;

implementation

{$R *.dfm}

uses MyFunction, UDM, Ulistpembelian;

procedure TFtambah_edit_pembelian.btcancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFtambah_edit_pembelian.btsimpanClick(Sender: TObject);
begin
  if Edkodepembelian.Text='' then
 begin
   Messagedlg('Kode Pembelian Tidak Boleh Kosong',mtWarning,[Mbok],0);
   Exit;
 end;
 if cbnama_supplier.Text='' then
 begin
   Messagedlg('Nama supplier Tidak Boleh Kosong',mtWarning,[Mbok],0);
   Exit;
 end;
 if Edkodesupplier.Text='' then
 begin
   Messagedlg('Kode supplier Tidak Boleh Kosong',mtWarning,[Mbok],0);
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
    SQL.Text:='INSERT INTO pos.tpembelian_master(kode_pembelian, '+
              'tgl_pembelian,kode_supplier,no_bukti) VALUES('+
        QuotedStr(Edkodepembelian.Text)+','+
        QuotedStr(FormatDateTime('yyyy-mm-dd',Dtpembelian.DateTime))+','+
        QuotedStr(Edkodesupplier.Text)+','+
        QuotedStr(Ednobukti.Text)+')';
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
      SQL.Text:='INSERT INTO pos.tpembelian_detail(kode_pembelian,'+
                'kode_barang,qty,harga_beli,sub_total) VALUES('+
          QuotedStr(Edkodepembelian.Text)+','+
          QuotedStr(CDS1kode_barang.Text)+','+
          FloatToStr(CDS1qty.Value)+','+
          FloatToStr(CDS1harga_beli.Value)+','+
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
    SQL.Text:='UPDATE pos.tpembelian_master SET '+
        'tgl_pembelian='+QuotedStr(FormatDateTime('yyyy-mm-dd',Dtpembelian.DateTime))+','+
        'kode_supplier= '+QuotedStr(Edkodesupplier.Text)+','+
        'no_bukti= '+QuotedStr(Ednobukti.Text)+
        ' WHERE kode_pembelian= '+QuotedStr(Edkodepembelian.Text);
    Execute;
  end;
  //DETAIL
    with dm.Qtemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='DELETE FROM pos.tpembelian_detail '+
         ' WHERE kode_pembelian= '+QuotedStr(Edkodepembelian.Text);
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
      SQL.Text:='INSERT INTO pos.tpembelian_detail(kode_pembelian,'+
                'kode_barang,qty,harga_beli,sub_total) VALUES('+
          QuotedStr(Edkodepembelian.Text)+','+
          QuotedStr(CDS1kode_barang.Text)+','+
          FloatToStr(CDS1qty.Value)+','+
          FloatToStr(CDS1harga_beli.Value)+','+
          FloatToStr(CDS1sub_total.Value)+')';
      Execute;
      CDS1.Next;
    end;
  end;
   Messagedlg('Ubah Data Berhasil',MtInformation,[Mbok],0);
 end;
  Flistpembelian.btrefreshClick(Sender);
  Close;
end;

procedure TFtambah_edit_pembelian.cbnama_supplierChange(Sender: TObject);
begin
   with dm.Qtemp do
    begin
       SQL.Clear;
       sql.Text := 'select kode_supplier from tsupplier where nama_supplier='+QuotedStr(cbnama_supplier.Text);
       Open;
      Edkodesupplier.Text:=FieldByName('kode_supplier').AsString;
    end;
end;

procedure TFtambah_edit_pembelian.cbnama_supplierDropDown(Sender: TObject);
begin
   with dm.Qtemp do
    begin
       SQL.Clear;
       sql.Text := 'select nama_supplier from tsupplier';
       Open;
      cbnama_supplier.Clear;
      dm.Qtemp.First;
      while not dm.Qtemp.Eof do
      begin
        cbnama_supplier.Items.Add(dm.Qtemp.FieldByName('nama_supplier').AsString);
        dm.Qtemp.Next;
      end;
    end;
end;

procedure TFtambah_edit_pembelian.DBGrid1ColExit(Sender: TObject);
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
    if (CDS1qty.Value<>0) or (CDS1harga_beli.Value<>0) then
      CDS1sub_total.Value := CDS1qty.Value * CDS1harga_beli.Value;
    CDS1.Post;
  end;
end;

procedure TFtambah_edit_pembelian.Delete1Click(Sender: TObject);
begin
 if CDS1.RecordCount > 0 then
  CDS1.Delete;
end;

procedure TFtambah_edit_pembelian.Edit1Click(Sender: TObject);
begin
  CDS1.Edit;
end;

procedure TFtambah_edit_pembelian.Insert1Click(Sender: TObject);
begin
 CDS1.Insert;
end;

end.
