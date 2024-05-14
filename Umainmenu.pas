unit Umainmenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls;

type
  TFmainmenu = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    DataMaster1: TMenuItem;
    DataBarang1: TMenuItem;
    DataPelanggan1: TMenuItem;
    DataSupplier1: TMenuItem;
    ransaksi1: TMenuItem;
    Pembelian1: TMenuItem;
    Penjualan1: TMenuItem;
    Image1: TImage;
    procedure Exit1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DataBarang1Click(Sender: TObject);
    procedure DataPelanggan1Click(Sender: TObject);
    procedure DataSupplier1Click(Sender: TObject);
    procedure Pembelian1Click(Sender: TObject);
    procedure Penjualan1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fmainmenu: TFmainmenu;

implementation

{$R *.dfm}

uses Ulogin, Ulistbarang, Ulistbarang1, Ulistpelanggan, Ulistsupplier,
  Ulistpembelian, Ulistpenjualan;

procedure TFmainmenu.DataBarang1Click(Sender: TObject);
begin
  Application.CreateForm(TFBarang,FBarang);
  FBarang.ShowModal;
  FBarang.Free;
end;

procedure TFmainmenu.DataPelanggan1Click(Sender: TObject);
begin
  Application.CreateForm(TFlistpelanggan,Flistpelanggan);
  Flistpelanggan.ShowModal;
  Flistpelanggan.Free;
end;

procedure TFmainmenu.DataSupplier1Click(Sender: TObject);
begin
    Application.CreateForm(TFlistsupplier,Flistsupplier);
  Flistsupplier.ShowModal;
  Flistsupplier.Free;
end;

procedure TFmainmenu.Exit1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFmainmenu.FormShow(Sender: TObject);
begin
  Application.CreateForm(TFlogin,Flogin);
  Flogin.Show;
end;

procedure TFmainmenu.Pembelian1Click(Sender: TObject);
begin
      Application.CreateForm(TFlistpembelian,Flistpembelian);
  Flistpembelian.ShowModal;
  Flistpembelian.Free;
end;

procedure TFmainmenu.Penjualan1Click(Sender: TObject);
begin
  Application.CreateForm(TFlistpenjualan,Flistpenjualan);
  Flistpenjualan.ShowModal;
  Flistpenjualan.Free;
end;

end.
