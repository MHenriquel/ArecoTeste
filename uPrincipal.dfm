object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Itens'
  ClientHeight = 624
  ClientWidth = 1059
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Calibri'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 19
  object grbItens: TGroupBox
    Left = 8
    Top = 1
    Width = 1041
    Height = 313
    Caption = ' Itens '
    TabOrder = 0
    object dbgItens: TDBGrid
      Left = 2
      Top = 21
      Width = 1037
      Height = 290
      Align = alClient
      DrawingStyle = gdsGradient
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -16
      TitleFont.Name = 'Calibri'
      TitleFont.Style = []
      OnCellClick = dbgItensCellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'Id'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'C'#243'digo'
          Width = 155
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Nome'
          Width = 261
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Descri'#231#227'o'
          Width = 323
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Vlr Unit.'
          Width = 103
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Peso x Altura'
          Width = 107
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'C'#243'd. Categoria'
          Width = 112
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Nome Categoria'
          Width = 272
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'C'#243'd. Servi'#231'o'
          Width = 128
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Nome Servi'#231'o'
          Width = 294
          Visible = True
        end>
    end
  end
  object grbDadosItens: TGroupBox
    Left = 8
    Top = 320
    Width = 1039
    Height = 255
    Caption = ' Dados dos Itens '
    TabOrder = 1
    object Label3: TLabel
      Left = 13
      Top = 26
      Width = 12
      Height = 19
      Caption = 'Id'
    end
    object Label1: TLabel
      Left = 13
      Top = 56
      Width = 45
      Height = 19
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel
      Left = 476
      Top = 56
      Width = 38
      Height = 19
      Caption = 'Nome'
    end
    object Label4: TLabel
      Left = 13
      Top = 86
      Width = 64
      Height = 19
      Caption = 'Descri'#231#227'o'
    end
    object Label5: TLabel
      Left = 13
      Top = 116
      Width = 49
      Height = 19
      Caption = 'Vlr Unit'
    end
    object Label6: TLabel
      Left = 13
      Top = 147
      Width = 85
      Height = 19
      Caption = 'Peso x Altura'
    end
    object Label7: TLabel
      Left = 13
      Top = 178
      Width = 63
      Height = 19
      Caption = 'Categoria'
    end
    object Label8: TLabel
      Left = 15
      Top = 208
      Width = 46
      Height = 19
      Caption = 'Servi'#231'o'
    end
    object edtID: TEdit
      Left = 102
      Top = 23
      Width = 121
      Height = 26
      Enabled = False
      TabOrder = 0
    end
    object edtCodigo: TEdit
      Left = 102
      Top = 53
      Width = 336
      Height = 26
      MaxLength = 50
      TabOrder = 1
    end
    object edtNome: TEdit
      Left = 533
      Top = 53
      Width = 494
      Height = 26
      MaxLength = 200
      TabOrder = 2
    end
    object edtDescricao: TEdit
      Left = 102
      Top = 83
      Width = 925
      Height = 26
      MaxLength = 300
      TabOrder = 3
    end
    object dblPesoAltura: TDBLookupComboBox
      Left = 102
      Top = 143
      Width = 555
      Height = 27
      TabOrder = 5
    end
    object dblCategoria: TDBLookupComboBox
      Left = 102
      Top = 174
      Width = 555
      Height = 27
      TabOrder = 6
    end
    object dblServico: TDBLookupComboBox
      Left = 102
      Top = 205
      Width = 555
      Height = 27
      TabOrder = 7
    end
    object btnServicos: TButton
      Left = 666
      Top = 204
      Width = 30
      Height = 29
      Cursor = crHandPoint
      Hint = 'Clique para cadastrar Servi'#231'os'
      Caption = '...'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = btnServicosClick
    end
    object btnProduto: TButton
      Left = 666
      Top = 143
      Width = 30
      Height = 27
      Cursor = crHandPoint
      Hint = 'Clique para cadastrar Peso x Altura'
      Caption = '...'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      OnClick = btnProdutoClick
    end
    object btnCategoria: TButton
      Left = 666
      Top = 174
      Width = 30
      Height = 27
      Cursor = crHandPoint
      Hint = 'Clique para cadastrar Categorias'
      Caption = '...'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      OnClick = btnCategoriaClick
    end
    object edtVlrUnit: TMaskEdit
      Left = 102
      Top = 112
      Width = 115
      Height = 27
      TabOrder = 4
      OnExit = edtVlrUnitExit
    end
  end
  object btnInserir: TButton
    Left = 8
    Top = 581
    Width = 113
    Height = 36
    Cursor = crHandPoint
    Caption = 'Inserir'
    DisabledImageIndex = 1
    ImageIndex = 0
    Images = ImageList1
    TabOrder = 2
    OnClick = btnInserirClick
  end
  object btnEditar: TButton
    Left = 125
    Top = 581
    Width = 113
    Height = 36
    Cursor = crHandPoint
    Caption = 'Editar'
    DisabledImageIndex = 5
    ImageIndex = 4
    Images = ImageList1
    TabOrder = 3
    OnClick = btnEditarClick
  end
  object btnDeletar: TButton
    Left = 246
    Top = 581
    Width = 113
    Height = 36
    Cursor = crHandPoint
    Caption = 'Deletar'
    DisabledImageIndex = 3
    ImageIndex = 2
    Images = ImageList1
    TabOrder = 4
    OnClick = btnDeletarClick
  end
  object btnGravar: TButton
    Left = 368
    Top = 581
    Width = 113
    Height = 36
    Cursor = crHandPoint
    Caption = 'Gravar'
    DisabledImageIndex = 9
    ImageIndex = 8
    Images = ImageList1
    TabOrder = 5
    OnClick = btnGravarClick
  end
  object btnDesfazer: TButton
    Left = 493
    Top = 582
    Width = 113
    Height = 36
    Cursor = crHandPoint
    Caption = 'Desfazer'
    DisabledImageIndex = 7
    ImageIndex = 6
    Images = ImageList1
    TabOrder = 6
    OnClick = btnDesfazerClick
  end
  object dbnItens: TDBNavigator
    Left = 858
    Top = 581
    Width = 192
    Height = 38
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    TabOrder = 7
    OnClick = dbnItensClick
  end
  object SQLConnection: TSQLConnection
    ConnectionName = 'FBConnection'
    DriverName = 'Firebird'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbxfb.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Firebird'
      'Database=C:\Delphi\ArecoTeste\BancoDados\MAYKEL.FDB'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=sysdba'
      'ServerCharSet='
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'IsolationLevel=ReadCommitted'
      'Trim Char=False')
    VendorLib = 'fbclient.dll'
    Connected = True
    Left = 976
    Top = 256
  end
  object ImageList1: TImageList
    Left = 1008
    Top = 256
    Bitmap = {
      494C01010A005000300010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F000000
      000000000000000000000000000000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F000000
      00007F7F7F00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00000000000000
      00007F7F7F0000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008080000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007F7F7F007F7F7F0000000000FFFFFF007F7F
      7F00FFFFFF007F7F7F00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0000FFFF000000000000FFFF00FFFFFF000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000007F7F7F0000000000000000007F7F7F0000000000000000007F7F
      7F00000000007F7F7F00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000000000FFFF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      00007F7F7F00FFFFFF00000000000000000000000000000000007F7F7F000000
      0000000000007F7F7F00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000000000FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      00007F7F7F00FFFFFF000000000000000000000000007F7F7F00000000000000
      00007F7F7F007F7F7F00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000
      0000008080000000000000000000000000000000000000000000000000007F7F
      7F007F7F7F00FFFFFF0000000000000000000000000000000000000000007F7F
      7F00FFFFFF007F7F7F00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      00000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
      00000080800000000000000000000000000000000000000000007F7F7F000000
      00007F7F7F0000000000FFFFFF000000000000000000000000007F7F7F007F7F
      7F00FFFFFF007F7F7F00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF00000000000000FFFF00FFFFFF0000FFFF000000000000FFFF000000
      000000808000000000000000000000000000000000007F7F7F00FFFFFF00FFFF
      FF00000000007F7F7F0000000000FFFFFF00000000007F7F7F00000000007F7F
      7F00FFFFFF007F7F7F00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      0000FFFF0000FFFF00000000000000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000008080000000000000000000000000007F7F7F007F7F7F007F7F7F00FFFF
      FF00FFFFFF00000000007F7F7F0000000000FFFFFF00FFFFFF00FFFFFF007F7F
      7F00FFFFFF007F7F7F00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF0000FFFF0000FFFF0000000000000000000000000000000000000000
      0000008080000000000000000000000000007F7F7F007F7F7F007F7F7F007F7F
      7F00FFFFFF00FFFFFF00000000007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F00FFFFFF007F7F7F00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF0000000000000000000000000000000000000000000000FF
      FF0000FFFF000000000000000000000000007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F00FFFFFF007F7F7F00000000000000000000000000000000007F7F
      7F007F7F7F007F7F7F00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000808000000000000000000000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F0000000000000000000000000000000000000000007F7F
      7F00FFFFFF007F7F7F00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF00000000000000000000000000000000007F7F7F007F7F
      7F007F7F7F000000000000000000000000000000000000000000000000007F7F
      7F007F7F7F007F7F7F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF007F7F7F00FFFFFF00FFFFFF000000000000000000FFFF
      FF0000000000FFFFFF00FFFFFF007F7F7F000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF000000000000000000FFFFFF00000000007F7F7F007F7F7F00FFFFFF007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F0000000000FFFFFF007F7F7F000000
      00007F7F7F007F7F7F00000000007F7F7F000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000007F7F
      7F007F7F7F007F7F7F007F7F7F00FFFFFF00FFFFFF00000000007F7F7F007F7F
      7F00FFFFFF00FFFFFF000000000000000000FFFF0000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000007F7F7F007F7F7F007F7F7F000000
      0000000000000000000000000000FFFFFF007F7F7F00FFFFFF00000000000000
      00000000000000000000FFFFFF007F7F7F0000000000000000000000FF000000
      FF0000000000000000007F7F7F00000000007F7F7F00000000000000FF000000
      FF000000FF0000000000000000000000000000000000000000007F7F7F007F7F
      7F00FFFFFF00FFFFFF00000000007F7F7F0000000000FFFFFF00000000007F7F
      7F007F7F7F00FFFFFF00FFFFFF0000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00000000007F7F7F007F7F7F00FFFFFF000000
      000000000000000000007F7F7F007F7F7F007F7F7F0000000000FFFFFF000000
      0000FFFFFF007F7F7F00000000007F7F7F00000000000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000000000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F00FFFFFF007F7F7F007F7F7F007F7F7F00FFFFFF00000000000000
      00007F7F7F007F7F7F00FFFFFF0000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000000000FFFFFF000000
      000000000000FFFFFF00FFFFFF00000000007F7F7F007F7F7F00FFFFFF000000
      0000000000000000000000000000FFFFFF00FFFFFF007F7F7F00FFFFFF007F7F
      7F007F7F7F00FFFFFF00000000007F7F7F00000000000000FF00000000000000
      FF000000FF000000FF007F7F7F00000000007F7F7F0000000000000000000000
      00000000FF000000FF000000000000000000000000007F7F7F00FFFFFF007F7F
      7F007F7F7F007F7F7F00000000007F7F7F000000000000000000000000000000
      0000000000007F7F7F00FFFFFF00FFFFFF00FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000000000000000000000FF
      FF0000000000FFFFFF00FFFFFF00000000007F7F7F007F7F7F00FFFFFF000000
      000000000000000000007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F000000
      00007F7F7F0000000000000000007F7F7F000000FF000000FF00000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000FF000000FF00000000007F7F7F007F7F7F00FFFFFF000000
      00007F7F7F007F7F7F007F7F7F00FFFFFF00FFFFFF0000000000000000000000
      0000000000007F7F7F007F7F7F00FFFFFF00FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00000000007F7F7F007F7F7F00FFFFFF000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007F7F
      7F000000000000000000000000007F7F7F000000FF000000FF00000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000FF000000FF00000000007F7F7F007F7F7F00FFFFFF000000
      0000000000007F7F7F00000000007F7F7F00FFFFFF00FFFFFF00000000000000
      0000000000007F7F7F007F7F7F00FFFFFF00FFFF00000000000000FFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000007F7F7F007F7F7F00FFFFFF00FFFF
      FF007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F000000
      000000000000FFFFFF00FFFFFF007F7F7F000000FF000000FF00000000000000
      000000000000000000007F7F7F00000000007F7F7F0000000000000000000000
      0000000000000000FF000000FF00000000007F7F7F007F7F7F00FFFFFF000000
      00000000000000000000000000007F7F7F007F7F7F00FFFFFF00FFFFFF000000
      0000000000007F7F7F007F7F7F00FFFFFF0000000000000000000000000000FF
      FF00FFFFFF0000FFFF00000000000000000000FFFF0000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00000000007F7F7F007F7F7F007F7F7F000000
      0000FFFFFF00FFFFFF007F7F7F007F7F7F00000000007F7F7F00000000000000
      00007F7F7F007F7F7F00000000007F7F7F000000FF000000FF00000000000000
      000000000000000000000000800000000000000080000000FF00000000000000
      0000000000000000FF000000FF00000000007F7F7F007F7F7F00FFFFFF000000
      000000000000000000007F7F7F007F7F7F007F7F7F00FFFFFF00FFFFFF00FFFF
      FF00000000007F7F7F007F7F7F00FFFFFF000000000000000000000000000000
      000000000000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000007F7F
      7F007F7F7F007F7F7F007F7F7F00000000007F7F7F0000000000000000000000
      000000000000FFFFFF00FFFFFF007F7F7F000000FF000000FF00000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      0000000000000000FF000000FF00000000007F7F7F007F7F7F00FFFFFF00FFFF
      FF0000000000000000007F7F7F007F7F7F007F7F7F00000000007F7F7F00FFFF
      FF00FFFFFF007F7F7F007F7F7F00000000000000000000000000000000000000
      0000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000007F7F7F00000000007F7F7F000000000000000000FFFFFF00FFFF
      FF007F7F7F007F7F7F007F7F7F007F7F7F00000000000000FF000000FF000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000FF000000000000000000000000007F7F7F0000000000FFFF
      FF00FFFFFF00000000007F7F7F007F7F7F007F7F7F00000000007F7F7F007F7F
      7F00FFFFFF007F7F7F00FFFFFF00000000000000000000000000000000000000
      00000000000000FFFF0000000000FFFFFF00FFFFFF000000000000000000FFFF
      FF0000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      00007F7F7F00000000007F7F7F00FFFFFF00000000007F7F7F007F7F7F000000
      00007F7F7F00FFFFFF00000000007F7F7F00000000000000FF000000FF000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000000000000000000000007F7F7F007F7F7F000000
      0000FFFFFF00FFFFFF007F7F7F007F7F7F007F7F7F00FFFFFF007F7F7F007F7F
      7F007F7F7F007F7F7F0000000000000000000000000000000000000000000000
      000000FFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000007F7F
      7F00FFFFFF007F7F7F007F7F7F00FFFFFF000000000000000000000000000000
      00007F7F7F00FFFFFF007F7F7F000000000000000000000000000000FF000000
      FF000000FF00000000007F7F7F00000000007F7F7F0000000000000000000000
      FF000000FF0000000000000000000000000000000000000000007F7F7F007F7F
      7F0000000000FFFFFF00FFFFFF007F7F7F00FFFFFF00FFFFFF00FFFFFF007F7F
      7F007F7F7F000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000000000007F7F7F007F7F
      7F007F7F7F00000000007F7F7F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF007F7F7F007F7F7F0000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000007F7F
      7F007F7F7F007F7F7F000000000000000000000000007F7F7F007F7F7F007F7F
      7F00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F0000000000000000007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F007F7F7F00FFFFFF0000000000000000000000000000000000000000000000
      0000000000007F7F7F007F7F7F007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F7F7F007F7F7F007F7F7F000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF007F7F
      7F007F7F7F00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000007F7F7F007F7F7F007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000007F7F7F007F7F7F007F7F7F00000000000000FF000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F00FFFFFF000000000000000000000000000000
      0000000000000000000000000000FFFFFF00000000000000FF000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F00FFFFFF000000000000000000000000000000
      0000000000000000000000000000FFFFFF00000000000000FF000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F00000000000000000000000000000000000000
      000000000000000000007F7F7F007F7F7F00000000000000FF000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F00000000000000000000000000000000000000
      000000000000000000007F7F7F007F7F7F000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F007F7F7F00FFFFFF0000000000000000000000000000000000000000000000
      000000000000000000007F7F7F007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F007F7F7F000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F007F7F7F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      000000000000000000007F7F7F007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000000000007F7F7F007F7F7F000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007F7F7F00FFFFFF00FFFFFF00000000000000
      000000000000000000007F7F7F007F7F7F000000000000000000000000000000
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F00FFFFFF0000000000000000000000000000000000000000000000
      000000000000000000007F7F7F007F7F7F000000000000000000000000000000
      0000000000000000000000000000FF000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF007F7F7F007F7F7F00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF0000000000000000000000000000000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF007F7F
      7F007F7F7F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF000000000000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      00000000FF000000FF000000000000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F00FFFF
      FF007F7F7F007F7F7F00FFFFFF000000000000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      00000000FF000000FF000000000000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F00FFFF
      FF007F7F7F007F7F7F00FFFFFF000000000000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      00000000FF000000FF000000000000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F000000
      00007F7F7F007F7F7F00000000000000000000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      00000000FF000000FF000000000000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F000000
      00007F7F7F007F7F7F0000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007F7F7F007F7F7F0000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00000000000000000000000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F007F7F7F00FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007F7F7F000000000000000000000000000000
      0000000000007F7F7F007F7F7F007F7F7F000000000000000000000000000000
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F000000000000000000000000000000000000000000000000000000
      0000000000007F7F7F007F7F7F007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F7F7F007F7F7F007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F7F7F007F7F7F007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF00FFFFC00B000000008017801300000000
      FFF7FF3500000000FE63FE4100000000FC03FD8100000000F803FB6900000000
      F003F3D900000000F003F3B100000000E003E3E100000000C003D5C100000000
      80038AA1000000000003050100000000000302010000000001E301E100000000
      83E383E100000000C7E3C7E300000000FC00FC00FFFFFC1FFC009068F83FF007
      20000092E00FE04300001E3CCC47C2A100001C528463803100001E02A07382F8
      00001C1631F910780000180E38F91A38000000183C791E18000010B23C391C08
      E000E1783C190C41F800FAC09C0BA441F000F4928C439003E001E0F1C467C807
      C403C403E00FE38FEC07EC07F83FF83FFFFFF3FCFFFFFFFCE7F8E3F8FFF8FFF8
      E7F8C0F8FFF8C0F881FF80FE81FF80FE81FC81FC81FC81FCE7FCE3FCFFFCFFFC
      E7FFE7FEFFFFFFFEFFFCFF7CFFFCFBFCFEFCFE3CF7FCF3FCFE7FC009E7FFC009
      80138001801380018013801380138013FE7FFE7CE7FFE3FCFEF8FEF8F7F8F7F8
      FFF8FFF8FFF8FFF8FFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
end