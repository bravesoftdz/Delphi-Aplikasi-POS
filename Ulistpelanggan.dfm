object Flistpelanggan: TFlistpelanggan
  Left = 0
  Top = 0
  Caption = 'Pelanggan'
  ClientHeight = 420
  ClientWidth = 729
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
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
    DataSource = DSpelanggan
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
        FieldName = 'id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'kode_pelanggan'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nama_pelanggan'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'alamat'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'no_telp'
        Visible = True
      end>
  end
  object Qpelanggan: TUniQuery
    Connection = DM.UniConnection1
    SQL.Strings = (
      'SELECT * FROM tpelanggan'
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
    object Qpelangganid: TIntegerField
      FieldName = 'id'
    end
    object Qpelanggankode_pelanggan: TStringField
      FieldName = 'kode_pelanggan'
      Required = True
    end
    object Qpelanggannama_pelanggan: TStringField
      FieldName = 'nama_pelanggan'
      Required = True
      Size = 60
    end
    object Qpelangganalamat: TMemoField
      FieldName = 'alamat'
      Required = True
      OnGetText = QpelangganalamatGetText
      BlobType = ftMemo
    end
    object Qpelangganno_telp: TStringField
      FieldName = 'no_telp'
      Required = True
      Size = 13
    end
  end
  object DSpelanggan: TUniDataSource
    DataSet = Qpelanggan
    Left = 216
    Top = 96
  end
end
