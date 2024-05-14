unit Ulistpembelian;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Data.DB, DBAccess, Uni, MemDS;

type
  TFlistpembelian = class(TForm)
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
    Qpembelian: TUniQuery;
    DSpembelian: TUniDataSource;
    Qpembelianid: TIntegerField;
    Qpembeliankode_pembelian: TStringField;
    Qpembeliantgl_pembelian: TDateField;
    Qpembeliankode_supplier: TStringField;
    Qpembelianno_bukti: TStringField;
    Qpembeliannama_supplier: TStringField;
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
  Flistpembelian: TFlistpembelian;

implementation

{$R *.dfm}

uses MyFunction, UDM, Upembelian;

procedure TFlistpembelian.bteditClick(Sender: TObject);
begin
  Application.CreateForm(TFtambah_edit_pembelian,Ftambah_edit_pembelian);
  status_simpan := 2;
  //master
  Ftambah_edit_pembelian.Edkodepembelian.Text := Qpembeliankode_pembelian.AsString;
  Ftambah_edit_pembelian.Dtpembelian.DateTime := Qpembeliantgl_pembelian.AsDateTime;
  Ftambah_edit_pembelian.Edkodesupplier.Text := Qpembeliankode_supplier.AsString;
  Ftambah_edit_pembelian.cbnama_supplier.Text := Qpembeliannama_supplier.AsString;
  Ftambah_edit_pembelian.Ednobukti.Text := Qpembelianno_bukti.AsString;
  //detail
  with dm.Qtemp do
    begin
       SQL.Clear;
       sql.Text := 'select tpd.*,tb.nama_barang,tb.satuan from tpembelian_detail tpd '+
       ' INNER JOIN tbarang tb ON tb.kode_barang=tpd.kode_barang '+
       ' WHERE tpd.kode_pembelian='+QuotedStr(Qpembeliankode_pembelian.AsString);
       Open;
      dm.Qtemp.First;
      while not dm.Qtemp.Eof do
      begin
        with Ftambah_edit_pembelian do
        begin
          CDS1.Insert;
          CDS1kode_barang.Text := FieldByName('kode_barang').AsString;
          CDS1nama_barang.Text := FieldByName('nama_barang').AsString;
          CDS1satuan.Text := FieldByName('satuan').AsString;
          CDS1harga_beli.AsFloat := FieldByName('harga_beli').AsFloat;
          CDS1qty.AsFloat := FieldByName('qty').AsFloat;
          CDS1sub_total.AsFloat := FieldByName('sub_total').AsFloat;
          CDS1.Post;
        end;
        dm.Qtemp.Next;
      end;
    end;
  Ftambah_edit_pembelian.ShowModal;
  Ftambah_edit_pembelian.Free;
end;

procedure TFlistpembelian.bthapusClick(Sender: TObject);
begin
  if Application.MessageBox('Apakah anda yakin ingin menghapus data yang dipilih',
  'konfirmasi',
  MB_YESNO or MB_ICONINFORMATION)=idyes then
  begin
    //MASTER
    with dm.Qtemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='DELETE FROM pos.tpembelian_master '+
         ' WHERE kode_pembelian= '+QuotedStr(Qpembeliankode_pembelian.AsString);
      Execute;
    end;
    //DETAIL
    with dm.Qtemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='DELETE FROM pos.tpembelian_detail '+
         ' WHERE kode_pembelian= '+QuotedStr(Qpembeliankode_pembelian.AsString);
      Execute;
    end;
    btrefreshClick(Sender);
  end;
end;

procedure TFlistpembelian.btrefreshClick(Sender: TObject);
begin
  Edcari.Clear;
  Qpembelian.MacroByName('WHERE').Value:='';
  if Qpembelian.Active then
    Qpembelian.Refresh
  else
    Qpembelian.Open;
end;

procedure TFlistpembelian.bttambahClick(Sender: TObject);
begin
  Application.CreateForm(TFtambah_edit_pembelian,Ftambah_edit_pembelian);
  status_simpan := 1;
  Cflg_aktif := 0;
  Ftambah_edit_pembelian.Edkodepembelian.Text := Autokode('kode_pembelian','tpembelian_master','PO');
  Ftambah_edit_pembelian.Dtpembelian.DateTime := Now;
  Ftambah_edit_pembelian.ShowModal;
  Ftambah_edit_pembelian.Free;
end;

procedure TFlistpembelian.DBGrid1DblClick(Sender: TObject);
begin
 bteditClick(Sender);
end;

procedure TFlistpembelian.EdcariChange(Sender: TObject);
begin
 Qpembelian.MacroByName('WHERE').Value:= 'WHERE tpm.kode_pembelian LIKE '+QuotedStr('%'+Edcari.Text+'%')+
    ' OR tpm.kode_supplier LIKE '+QuotedStr('%'+Edcari.Text+'%')+
    ' OR ts.nama_supplier LIKE '+QuotedStr('%'+Edcari.Text+'%');
  if Qpembelian.Active then
    Qpembelian.Refresh
  else
    Qpembelian.Open;
  end;

procedure TFlistpembelian.FormShow(Sender: TObject);
begin
  btrefreshClick(Sender);
end;

end.
