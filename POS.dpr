program POS;

uses
  Vcl.Forms,
  Ulogin in 'Ulogin.pas' {Flogin},
  UDM in 'UDM.pas' {DM: TDataModule},
  MyFunction in 'MyFunction.pas',
  Umainmenu in 'Umainmenu.pas' {Fmainmenu},
  Ulistpenjualan in 'Ulistpenjualan.pas' {Flistpenjualan},
  Upenjualan in 'Upenjualan.pas' {Ftambah_edit_penjualan},
  UBarang in 'UBarang.pas' {Ftambah_edit_barang},
  Ulistbarang in 'Ulistbarang.pas' {FBarang},
  Ulistpelanggan in 'Ulistpelanggan.pas' {Flistpelanggan},
  UPelanggan in 'UPelanggan.pas' {Ftambah_edit_pelanggan},
  Ulistsupplier in 'Ulistsupplier.pas' {Flistsupplier},
  Usupplier in 'Usupplier.pas' {Ftambah_edit_supplier},
  Ulistpembelian in 'Ulistpembelian.pas' {Flistpembelian},
  Upembelian in 'Upembelian.pas' {Ftambah_edit_pembelian};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFmainmenu, Fmainmenu);
  Application.Run;
end.
