inherited frmManPrestadorUsuario: TfrmManPrestadorUsuario
  Left = 441
  Top = 216
  Caption = 'Usuarios por prestador'
  ClientWidth = 709
  ExplicitLeft = 441
  ExplicitTop = 216
  ExplicitWidth = 717
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 709
    Height = 89
    Visible = True
    ExplicitWidth = 709
    ExplicitHeight = 89
    object GroupBox1: TGroupBox
      Left = 3
      Top = 1
      Width = 626
      Height = 42
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Prestador'
      TabOrder = 0
      DesignSize = (
        626
        42)
      inline fraPrestadorFiltro: TfraPrestador
        Left = 7
        Top = 13
        Width = 613
        Height = 27
        VertScrollBar.Range = 49
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 7
        ExplicitTop = 13
        ExplicitWidth = 613
        ExplicitHeight = 27
        inherited lbSec: TLabel [0]
          Left = 12
          Width = 22
          ExplicitLeft = 12
          ExplicitWidth = 22
        end
        inherited lbCUIT: TLabel [1]
          Width = 25
          ExplicitWidth = 25
        end
        inherited lbIdentif: TLabel
          Left = 83
          Top = 7
          Width = 11
          Caption = 'ID'
          ExplicitLeft = 83
          ExplicitTop = 7
          ExplicitWidth = 11
        end
        inherited lbRSocial: TLabel
          Left = 144
          Top = 7
          Width = 40
          ExplicitLeft = 144
          ExplicitTop = 7
          ExplicitWidth = 40
        end
        inherited lbDomicilio: TLabel
          Width = 42
          ExplicitWidth = 42
        end
        inherited lbLocalidad: TLabel
          Width = 46
          ExplicitWidth = 46
        end
        inherited lbCPostal: TLabel
          Left = 524
          Width = 14
          ExplicitLeft = 524
          ExplicitWidth = 14
        end
        inherited lbTelefono: TLabel
          Left = 436
          ExplicitLeft = 436
        end
        inherited edPrestSecuencia: TIntEdit [8]
          Left = 32
          TabStop = False
          ExplicitLeft = 32
        end
        inherited cmbPrestFantasia: TArtComboBox [9]
          Width = 141
          ExplicitWidth = 141
        end
        inherited mskPrestCUIT: TMaskEdit [10]
          Left = 0
          ExplicitLeft = 0
        end
        inherited cmbPrestador: TArtComboBox [11]
          Left = 188
          Width = 406
          ExplicitLeft = 188
          ExplicitWidth = 406
        end
        inherited edPresDomicilio: TEdit [12]
        end
        inherited edPresLocalidad: TEdit [13]
          Width = 170
          ExplicitWidth = 170
        end
        inherited edPresCPostal: TEdit [14]
          Left = 541
          ExplicitLeft = 541
        end
        inherited edPrestIdentif: TIntEdit [15]
          Left = 97
          ExplicitLeft = 97
        end
        inherited edPresTelefono: TEdit
          Left = 437
          ExplicitLeft = 437
        end
        inherited sdqDatos: TSDQuery
          Top = 60
        end
        inherited dsDatos: TDataSource
          Top = 60
        end
      end
    end
    object GroupBox2: TGroupBox
      Left = 4
      Top = 43
      Width = 625
      Height = 40
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Usuario'
      TabOrder = 1
      DesignSize = (
        625
        40)
      inline fraUsuarioFiltro: TfraUsuario
        Left = 5
        Top = 15
        Width = 613
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitLeft = 5
        ExplicitTop = 15
        ExplicitWidth = 613
        inherited cmbDescripcion: TArtComboBox
          Width = 529
          ExplicitWidth = 529
        end
      end
    end
    object rgVerBajas: TRadioGroup
      Left = 631
      Top = 1
      Width = 77
      Height = 82
      Anchors = [akTop, akRight]
      Caption = 'Ver Bajas'
      ItemIndex = 0
      Items.Strings = (
        'Si'
        'No')
      TabOrder = 2
    end
  end
  inherited CoolBar: TCoolBar
    Top = 89
    Width = 709
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 703
      end>
    ExplicitTop = 89
    ExplicitWidth = 709
    inherited ToolBar: TToolBar
      Width = 694
      ExplicitWidth = 694
      inherited tbModificar: TToolButton
        Enabled = True
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 118
    Width = 709
    Height = 318
    Columns = <
      item
        Expanded = False
        FieldName = 'pu_idprestador'
        Title.Caption = 'ID Prestador'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cuit'
        Title.Caption = 'CUIT'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'prestador'
        Title.Caption = 'Prestador'
        Width = 500
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pu_usuario'
        Title.Caption = 'Usuario Asignado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pu_usubaja'
        Title.Caption = 'Usuario Baja'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pu_fechabaja'
        Title.Caption = 'Fecha Baja'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 74
    Top = 176
    Width = 649
    Height = 149
    BorderStyle = bsSingle
    ExplicitLeft = 74
    ExplicitTop = 176
    ExplicitWidth = 649
    ExplicitHeight = 149
    inherited BevelAbm: TBevel
      Top = 113
      Width = 641
      ExplicitTop = 113
      ExplicitWidth = 641
    end
    inherited btnAceptar: TButton
      Left = 491
      Top = 119
      ExplicitLeft = 491
      ExplicitTop = 119
    end
    inherited btnCancelar: TButton
      Left = 569
      Top = 119
      ExplicitLeft = 569
      ExplicitTop = 119
    end
    object gbPrestador: TGroupBox
      Left = 8
      Top = 9
      Width = 633
      Height = 46
      Caption = 'Prestador'
      TabOrder = 2
      inline fraPrestador: TfraPrestador
        Left = 7
        Top = 14
        Width = 618
        Height = 27
        VertScrollBar.Range = 49
        TabOrder = 0
        ExplicitLeft = 7
        ExplicitTop = 14
        ExplicitWidth = 618
        ExplicitHeight = 27
        inherited lbSec: TLabel [0]
          Left = 12
          Width = 22
          ExplicitLeft = 12
          ExplicitWidth = 22
        end
        inherited lbCUIT: TLabel [1]
          Width = 25
          ExplicitWidth = 25
        end
        inherited lbIdentif: TLabel
          Left = 83
          Top = 7
          Width = 11
          Caption = 'ID'
          ExplicitLeft = 83
          ExplicitTop = 7
          ExplicitWidth = 11
        end
        inherited lbRSocial: TLabel
          Left = 144
          Top = 7
          Width = 40
          ExplicitLeft = 144
          ExplicitTop = 7
          ExplicitWidth = 40
        end
        inherited lbDomicilio: TLabel
          Width = 42
          ExplicitWidth = 42
        end
        inherited lbLocalidad: TLabel
          Width = 46
          ExplicitWidth = 46
        end
        inherited lbCPostal: TLabel
          Left = 529
          Width = 14
          ExplicitLeft = 529
          ExplicitWidth = 14
        end
        inherited lbTelefono: TLabel
          Left = 441
          ExplicitLeft = 441
        end
        inherited edPrestSecuencia: TIntEdit [8]
          Left = 32
          TabStop = False
          ExplicitLeft = 32
        end
        inherited cmbPrestFantasia: TArtComboBox [9]
          Width = 199
          ExplicitWidth = 199
        end
        inherited mskPrestCUIT: TMaskEdit [10]
          Left = 0
          ExplicitLeft = 0
        end
        inherited cmbPrestador: TArtComboBox [11]
          Left = 188
          Width = 411
          ExplicitLeft = 188
          ExplicitWidth = 411
        end
        inherited edPresDomicilio: TEdit [12]
        end
        inherited edPresLocalidad: TEdit [13]
          Width = 175
          ExplicitWidth = 175
        end
        inherited edPresCPostal: TEdit [14]
          Left = 546
          ExplicitLeft = 546
        end
        inherited edPrestIdentif: TIntEdit [15]
          Left = 97
          ExplicitLeft = 97
        end
        inherited edPresTelefono: TEdit
          Left = 442
          ExplicitLeft = 442
        end
        inherited sdqDatos: TSDQuery
          Top = 60
        end
        inherited dsDatos: TDataSource
          Top = 60
        end
      end
    end
    object gbUsuario: TGroupBox
      Left = 8
      Top = 58
      Width = 633
      Height = 43
      Caption = 'Usuario'
      TabOrder = 3
      inline fraUsuario: TfraUsuario
        Left = 5
        Top = 15
        Width = 620
        Height = 21
        TabOrder = 0
        ExplicitLeft = 5
        ExplicitTop = 15
        ExplicitWidth = 620
        inherited cmbDescripcion: TArtComboBox
          Width = 536
          ExplicitWidth = 536
        end
      end
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT pu_idprestador, art.utiles.armar_cuit (ca_clave) cuit,'
      
        '       ca_descripcion prestador, pu_usuario, pu_usualta, pu_fech' +
        'aalta,'
      '       pu_usubaja, pu_fechabaja, pu_id'
      '  FROM art.cpu_prestadorusuario, art.cpr_prestador'
      ' WHERE pu_idprestador = ca_identificador')
  end
  object ShortCutControl1: TShortCutControl
    ShortCuts = <
      item
        Key = 116
        LinkControl = tbRefrescar
      end
      item
        Key = 16462
        LinkControl = tbNuevo
      end
      item
        Key = 16461
        LinkControl = tbModificar
      end
      item
        Key = 16430
        LinkControl = tbEliminar
      end
      item
        Key = 16460
        LinkControl = tbLimpiar
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end>
    Left = 56
    Top = 316
  end
end
