unit Ulistsupplier;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Data.DB, DBAccess, Uni, MemDS;

type
  TFlistsupplier = class(TForm)
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
    Qsupplier: TUniQuery;
    DSsupplier: TUniDataSource;
    Qsupplierid: TIntegerField;
    Qsupplierkode_supplier: TStringField;
    Qsuppliernama_supplier: TStringField;
    Qsupplieralamat: TMemoField;
    Qsupplierno_telp: TStringField;
    procedure bttambahClick(Sender: TObject);
    procedure btrefreshClick(Sender: TObject);
    procedure bteditClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure bthapusClick(Sender: TObject);
    procedure EdcariChange(Sender: TObject);
    procedure QsupplieralamatGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Flistsupplier: TFlistsupplier;

implementation

{$R *.dfm}

uses MyFunction, UDM, Usupplier;

procedure TFlistsupplier.bteditClick(Sender: TObject);
begin
  Application.CreateForm(TFtambah_edit_supplier,Ftambah_edit_supplier);
  status_simpan := 2;
  Ftambah_edit_supplier.Edkodesupplier.Text := Qsupplierkode_supplier.AsString;
  Ftambah_edit_supplier.Ednamasupplier.Text := Qsuppliernama_supplier.AsString;
  Ftambah_edit_supplier.Ednotelp.Text := Qsupplierno_telp.AsString;
  Ftambah_edit_supplier.Memoalamat.Text := Qsupplieralamat.AsString;
  Ftambah_edit_supplier.ShowModal;
  Ftambah_edit_supplier.Free;
end;

procedure TFlistsupplier.bthapusClick(Sender: TObject);
begin
  if Application.MessageBox('Apakah anda yakin ingin menghapus data yang dipilih',
  'konfirmasi',
  MB_YESNO or MB_ICONINFORMATION)=idyes then
  begin
    with dm.Qtemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='DELETE FROM pos.tsupplier '+
         ' WHERE kode_supplier= '+QuotedStr(Qsupplierkode_supplier.AsString);
      Execute;
    end;
    btrefreshClick(Sender);
  end;
end;

procedure TFlistsupplier.btrefreshClick(Sender: TObject);
begin
  Edcari.Clear;
  Qsupplier.MacroByName('WHERE').Value:='';
  if Qsupplier.Active then
    Qsupplier.Refresh
  else
    Qsupplier.Open;
end;

procedure TFlistsupplier.bttambahClick(Sender: TObject);
begin
  Application.CreateForm(TFtambah_edit_supplier,Ftambah_edit_supplier);
  status_simpan := 1;
  Cflg_aktif := 0;
  Ftambah_edit_supplier.Edkodesupplier.Text := Autokode('kode_supplier','tsupplier','SP');
  Ftambah_edit_supplier.ShowModal;
  Ftambah_edit_supplier.Free;
end;

procedure TFlistsupplier.DBGrid1DblClick(Sender: TObject);
begin
 bteditClick(Sender);
end;

procedure TFlistsupplier.EdcariChange(Sender: TObject);
begin
  Qsupplier.MacroByName('WHERE').Value:= 'WHERE kode_supplier LIKE '+QuotedStr('%'+Edcari.Text+'%')+
    ' OR nama_supplier LIKE '+QuotedStr('%'+Edcari.Text+'%');
  if Qsupplier.Active then
    Qsupplier.Refresh
  else
    Qsupplier.Open;
  end;

procedure TFlistsupplier.FormShow(Sender: TObject);
begin
  btrefreshClick(Sender);
end;

procedure TFlistsupplier.QsupplieralamatGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Text := Copy(Qsupplieralamat.AsString, 1, 50);
end;

end.
