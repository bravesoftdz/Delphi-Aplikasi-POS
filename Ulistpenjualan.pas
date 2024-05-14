unit Ulistpenjualan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Data.DB, DBAccess, Uni, MemDS, frxClass, frxDBSet;

type
  TFlistpenjualan = class(TForm)
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
    Qpenjualan: TUniQuery;
    DSpenjualan: TUniDataSource;
    Qpenjualanid: TIntegerField;
    Qpenjualankode_penjualan: TStringField;
    Qpenjualantgl_penjualan: TDateField;
    Qpenjualankode_pelanggan: TStringField;
    Qpenjualanno_bukti: TStringField;
    Qpenjualantotal: TFloatField;
    Qpenjualanbayar: TFloatField;
    Qpenjualankembali: TFloatField;
    Qpenjualannama_pelanggan: TStringField;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    BitBtn1: TBitBtn;
    procedure bttambahClick(Sender: TObject);
    procedure btrefreshClick(Sender: TObject);
    procedure bteditClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure bthapusClick(Sender: TObject);
    procedure EdcariChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Flistpenjualan: TFlistpenjualan;

implementation

{$R *.dfm}

uses MyFunction, UDM, Upenjualan;

procedure TFlistpenjualan.BitBtn1Click(Sender: TObject);
begin
  frxReport1.ShowReport();
end;

procedure TFlistpenjualan.bteditClick(Sender: TObject);
begin
  Application.CreateForm(TFtambah_edit_penjualan,Ftambah_edit_penjualan);
  status_simpan := 2;
  //master
  Ftambah_edit_penjualan.Edkodepenjualan.Text := Qpenjualankode_penjualan.AsString;
  Ftambah_edit_penjualan.Dtpenjualan.DateTime := Qpenjualantgl_penjualan.AsDateTime;
  Ftambah_edit_penjualan.Edkodepelanggan.Text := Qpenjualankode_pelanggan.AsString;
  Ftambah_edit_penjualan.cbnama_pelanggan.Text := Qpenjualannama_pelanggan.AsString;
  Ftambah_edit_penjualan.Ednobukti.Text := Qpenjualanno_bukti.AsString;
  Ftambah_edit_penjualan.Edtotal.Text :=FloatToStr(Qpenjualantotal.AsFloat);
  Ftambah_edit_penjualan.Edbayar.Text :=FloatToStr(Qpenjualanbayar.AsFloat);
  Ftambah_edit_penjualan.Edkembali.Text :=FloatToStr(Qpenjualankembali.AsFloat);
  //detail
  with dm.Qtemp do
    begin
       SQL.Clear;
       sql.Text := 'select tpd.*,tb.nama_barang,tb.satuan from tpenjualan_detail tpd '+
       ' INNER JOIN tbarang tb ON tb.kode_barang=tpd.kode_barang '+
       ' WHERE tpd.kode_penjualan='+QuotedStr(Qpenjualankode_penjualan.AsString);
       Open;
      dm.Qtemp.First;
      while not dm.Qtemp.Eof do
      begin
        with Ftambah_edit_penjualan do
        begin
          CDS1.Insert;
          CDS1kode_barang.Text := FieldByName('kode_barang').AsString;
          CDS1nama_barang.Text := FieldByName('nama_barang').AsString;
          CDS1satuan.Text := FieldByName('satuan').AsString;
          CDS1harga_jual.AsFloat := FieldByName('harga_jual').AsFloat;
          CDS1qty.AsFloat := FieldByName('qty').AsFloat;
          CDS1sub_total.AsFloat := FieldByName('sub_total').AsFloat;
          CDS1.Post;
        end;
        dm.Qtemp.Next;
      end;
    end;
  Ftambah_edit_penjualan.ShowModal;
  Ftambah_edit_penjualan.Free;
end;

procedure TFlistpenjualan.bthapusClick(Sender: TObject);
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
      SQL.Text:='DELETE FROM pos.tpenjualan_master '+
         ' WHERE kode_penjualan= '+QuotedStr(Qpenjualankode_penjualan.AsString);
      Execute;
    end;
    //DETAIL
    with dm.Qtemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='DELETE FROM pos.tpenjualan_detail '+
         ' WHERE kode_penjualan= '+QuotedStr(Qpenjualankode_penjualan.AsString);
      Execute;
    end;
    btrefreshClick(Sender);
  end;
end;

procedure TFlistpenjualan.btrefreshClick(Sender: TObject);
begin
  Edcari.Clear;
  Qpenjualan.MacroByName('WHERE').Value:='';
  if Qpenjualan.Active then
    Qpenjualan.Refresh
  else
    Qpenjualan.Open;
end;

procedure TFlistpenjualan.bttambahClick(Sender: TObject);
begin
  Application.CreateForm(TFtambah_edit_penjualan,Ftambah_edit_penjualan);
  status_simpan := 1;
  Cflg_aktif := 0;
  Ftambah_edit_penjualan.Edkodepenjualan.Text := Autokode('kode_penjualan','tpenjualan_master','PJ');
  Ftambah_edit_penjualan.Dtpenjualan.DateTime := Now;
  Ftambah_edit_penjualan.ShowModal;
  Ftambah_edit_penjualan.Free;
end;

procedure TFlistpenjualan.DBGrid1DblClick(Sender: TObject);
begin
 bteditClick(Sender);
end;

procedure TFlistpenjualan.EdcariChange(Sender: TObject);
begin
 Qpenjualan.MacroByName('WHERE').Value:= 'WHERE tpm.kode_penjualan LIKE '+QuotedStr('%'+Edcari.Text+'%')+
    ' OR tpm.kode_pelanggan LIKE '+QuotedStr('%'+Edcari.Text+'%')+
    ' OR tp.nama_pelanggan LIKE '+QuotedStr('%'+Edcari.Text+'%');
  if Qpenjualan.Active then
    Qpenjualan.Refresh
  else
    Qpenjualan.Open;
  end;

procedure TFlistpenjualan.FormShow(Sender: TObject);
begin
  btrefreshClick(Sender);
end;

end.
