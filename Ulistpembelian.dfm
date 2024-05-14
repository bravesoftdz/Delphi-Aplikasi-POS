object Flistpembelian: TFlistpembelian
  Left = 0
  Top = 0
  Caption = 'Pembelian'
  ClientHeight = 420
  ClientWidth = 729
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 729
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 75
      Top = 0
      Height = 41
      ExplicitLeft = 84
    end
    object Splitter2: TSplitter
      Left = 153
      Top = 0
      Height = 41
      ExplicitLeft = 224
      ExplicitTop = 8
      ExplicitHeight = 100
    end
    object Splitter3: TSplitter
      Left = 231
      Top = 0
      Height = 41
      ExplicitLeft = 272
      ExplicitTop = 32
      ExplicitHeight = 100
    end
    object bttambah: TBitBtn
      Left = 0
      Top = 0
      Width = 75
      Height = 41
      Align = alLeft
      Caption = 'Tambah'
      TabOrder = 0
      OnClick = bttambahClick
    end
    object btedit: TBitBtn
      Left = 78
      Top = 0
      Width = 75
      Height = 41
      Align = alLeft
      Caption = 'Edit'
      TabOrder = 1
      OnClick = bteditClick
    end
    object bthapus: TBitBtn
      Left = 156
      Top = 0
      Width = 75
      Height = 41
      Align = alLeft
      Caption = 'Hapus'
      TabOrder = 2
      OnClick = bthapusClick
    end
    object btrefresh: TBitBtn
      Left = 234
      Top = 0
      Width = 75
      Height = 41
      Align = alLeft
      Caption = 'Refresh'
      TabOrder = 3
      OnClick = btrefreshClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 729
    Height = 20
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 3
      Top = 0
      Width = 19
      Height = 20
      Align = alLeft
      BiDiMode = bdLeftToRight
      Caption = 'Cari'
      ParentBiDiMode = False
      ExplicitHeight = 13
    end
    object Splitter4: TSplitter
      Left = 0
      Top = 0
      Height = 20
      ExplicitLeft = 96
      ExplicitTop = 8
      ExplicitHeight = 100
    end
    object Splitter5: TSplitter
      Left = 22
      Top = 0
      Height = 20
      ExplicitLeft = 120
      ExplicitTop = 8
      ExplicitHeight = 100
    end
    object Edcari: TEdit
      Left = 25
      Top = 0
      Width = 234
      Height = 20
      Align = alLeft
      TabOrder = 0
      OnChange = EdcariChange
      ExplicitHeight = 21
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 61
    Width = 729
    Height = 359
    Align = alClient
    DataSource = DSpembelian
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'tgl_pembelian'
        Title.Caption = 'Tanggal Pembelian'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'kode_pembelian'
        Title.Caption = 'Kode pembelian'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'kode_supplier'
        Title.Caption = 'Kode Supplier'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nama_supplier'
        Title.Caption = 'Nama Supplier'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'no_bukti'
        Title.Caption = 'No Bukti/kwitansi'
        Width = 120
        Visible = True
      end>
  end
  object Qpembelian: TUniQuery
    Connection = DM.UniConnection1
    SQL.Strings = (
      'SELECT tpm.*,ts.nama_supplier FROM tpembelian_master tpm'
      'INNER JOIN tsupplier ts ON ts.kode_supplier=tpm.kode_supplier'
      '&WHERE'
      '&ORDERBY')
    Left = 144
    Top = 96
    MacroData = <
      item
        Name = 'WHERE'
      end
      item
        Name = 'ORDERBY'
      end>
    object Qpembelianid: TIntegerField
      FieldName = 'id'
    end
    object Qpembeliankode_pembelian: TStringField
      FieldName = 'kode_pembelian'
    end
    object Qpembeliantgl_pembelian: TDateField
      FieldName = 'tgl_pembelian'
    end
    object Qpembeliankode_supplier: TStringField
      FieldName = 'kode_supplier'
    end
    object Qpembelianno_bukti: TStringField
      FieldName = 'no_bukti'
    end
    object Qpembeliannama_supplier: TStringField
      FieldName = 'nama_supplier'
      ReadOnly = True
      Required = True
      Size = 60
    end
  end
  object DSpembelian: TUniDataSource
    DataSet = Qpembelian
    Left = 216
    Top = 96
  end
end
