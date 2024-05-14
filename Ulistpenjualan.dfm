object Flistpenjualan: TFlistpenjualan
  Left = 0
  Top = 0
  Caption = 'Penjualan'
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
    object BitBtn1: TBitBtn
      Left = 309
      Top = 0
      Width = 75
      Height = 41
      Align = alLeft
      Caption = 'Report'
      TabOrder = 4
      OnClick = BitBtn1Click
      ExplicitLeft = 328
      ExplicitHeight = 35
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
    DataSource = DSpenjualan
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
        FieldName = 'tgl_penjualan'
        Title.Caption = 'Tanggal Penjualan'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'kode_penjualan'
        Title.Caption = 'Kode penjualan'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'kode_pelanggan'
        Title.Caption = 'Kode Pelanggan'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nama_pelanggan'
        Title.Caption = 'Nama Pelanggan'
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
  object Qpenjualan: TUniQuery
    Connection = DM.UniConnection1
    SQL.Strings = (
      'SELECT tpm.*,tp.nama_pelanggan FROM tpenjualan_master tpm'
      'INNER JOIN tpelanggan tp ON tp.kode_pelanggan=tpm.kode_pelanggan'
      '&WHERE'
      '&ORDERBY')
    Active = True
    Left = 144
    Top = 96
    MacroData = <
      item
        Name = 'WHERE'
      end
      item
        Name = 'ORDERBY'
      end>
    object Qpenjualanid: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
    end
    object Qpenjualankode_penjualan: TStringField
      FieldName = 'kode_penjualan'
    end
    object Qpenjualantgl_penjualan: TDateField
      FieldName = 'tgl_penjualan'
    end
    object Qpenjualankode_pelanggan: TStringField
      FieldName = 'kode_pelanggan'
    end
    object Qpenjualanno_bukti: TStringField
      FieldName = 'no_bukti'
    end
    object Qpenjualantotal: TFloatField
      FieldName = 'total'
    end
    object Qpenjualanbayar: TFloatField
      FieldName = 'bayar'
    end
    object Qpenjualankembali: TFloatField
      FieldName = 'kembali'
    end
    object Qpenjualannama_pelanggan: TStringField
      FieldName = 'nama_pelanggan'
      ReadOnly = True
      Required = True
      Size = 60
    end
  end
  object DSpenjualan: TUniDataSource
    DataSet = Qpenjualan
    Left = 216
    Top = 96
  end
  object frxReport1: TfrxReport
    Version = '4.12.2'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44737.479452615700000000
    ReportOptions.LastChange = 44737.483595810200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 152
    Top = 208
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 30.236240000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Left = 143.622140000000000000
          Width = 291.023810000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Report Penjualan')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 22.677180000000000000
        Top = 154.960730000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object frxDBDataset1kode_penjualan: TfrxMemoView
          Left = 11.338590000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'kode_penjualan'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."kode_penjualan"]')
          ParentFont = False
        end
        object frxDBDataset1tgl_penjualan: TfrxMemoView
          Left = 181.417440000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'tgl_penjualan'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."tgl_penjualan"]')
          ParentFont = False
        end
        object frxDBDataset1nama_pelanggan: TfrxMemoView
          Left = 268.346630000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'nama_pelanggan'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."nama_pelanggan"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 238.110390000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 642.520100000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#]')
        end
        object Memo6: TfrxMemoView
          Left = 472.441250000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Delphi')
          ParentFont = False
        end
      end
      object ColumnHeader1: TfrxColumnHeader
        Height = 22.677180000000000000
        Top = 71.811070000000000000
        Width = 718.110700000000000000
        object Memo3: TfrxMemoView
          Left = 7.559060000000000000
          Top = 3.779530000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Kode Penjualan')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 170.078850000000000000
          Top = 3.779530000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Tanggal Penjualan')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 343.937230000000000000
          Top = 3.779530000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Nama Pelanggan')
          ParentFont = False
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = Qpenjualan
    BCDToCurrency = False
    Left = 240
    Top = 208
  end
end
