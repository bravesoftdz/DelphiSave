inherited frmCampanaF931: TfrmCampanaF931
  Top = 122
  Width = 640
  Height = 480
  Caption = 'Campa'#241'a F931'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 632
    Height = 96
    Visible = True
    object GroupBox1: TGroupBox
      Left = 4
      Top = 4
      Width = 280
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Canal '
      TabOrder = 0
      DesignSize = (
        280
        44)
      inline fraCanalBusqueda: TfraCanal
        Left = 12
        Top = 16
        Width = 256
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          256
          23)
        inherited cmbDescripcion: TComboGrid
          Width = 193
          Cells = (
            'C'#243'digo'
            'Descripci'#243'n'
            'Id'
            'Fecha de Baja')
          ColWidths = (
            40
            300
            -1
            -1)
        end
      end
    end
    object GroupBox2: TGroupBox
      Left = 288
      Top = 4
      Width = 340
      Height = 44
      Anchors = [akTop, akRight]
      Caption = ' Entidad '
      TabOrder = 1
      DesignSize = (
        340
        44)
      inline fraEntidadBusqueda: TfraEntidades
        Left = 12
        Top = 16
        Width = 316
        Height = 23
        Anchors = [akTop, akRight]
        TabOrder = 0
        DesignSize = (
          316
          23)
        inherited cmbDescripcion: TArtComboBox
          Width = 251
          DataSource = nil
        end
      end
    end
    object GroupBox3: TGroupBox
      Left = 4
      Top = 52
      Width = 280
      Height = 40
      Caption = ' C.U.I.T. con la Solicitud de Afiliaci'#243'n en Provincia ART '
      TabOrder = 2
      object chkCuitSolAfiProvArt: TCheckBox
        Left = 133
        Top = 16
        Width = 97
        Height = 17
        TabOrder = 0
      end
    end
  end
  inherited CoolBar: TCoolBar
    Top = 96
    Width = 632
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 628
      end>
    inherited ToolBar: TToolBar
      Width = 615
      inherited tbModificar: TToolButton
        Visible = False
      end
      inherited tbLimpiar: TToolButton
        Visible = True
      end
      inherited tbMostrarFiltros: TToolButton
        Visible = True
      end
    end
  end
  inherited Grid: TArtDBGrid
    Top = 125
    Width = 632
    Height = 328
    Columns = <
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'codigoentidad'
        Title.Alignment = taRightJustify
        Title.Caption = 'C'#243'digo Entidad'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nombreentidad'
        Title.Caption = 'Entidad'
        Width = 243
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'ca_descuento'
        Title.Alignment = taRightJustify
        Title.Caption = 'Descuento'
        Width = 66
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ca_fechahasta'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Hasta'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ca_usualta'
        Title.Caption = 'Usuario Alta'
        Width = 127
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ca_fechaalta'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Alta'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ca_usubaja'
        Title.Caption = 'Usuario Baja'
        Width = 115
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ca_fechabaja'
        Title.Alignment = taCenter
        Title.Caption = 'Fecha Baja'
        Width = 91
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'codigoorganizador'
        Title.Alignment = taRightJustify
        Title.Caption = 'C'#243'digo Organizador'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nombreorganizador'
        Title.Caption = 'Organizador'
        Width = 193
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 132
    Top = 208
    Width = 400
    Height = 176
    Caption = 'Alta de Entidad para Campa'#241'a F931'
    BorderStyle = bsDialog
    ActiveControl = fraCanal.edCodigo
    inherited BevelAbm: TBevel
      Top = 140
      Width = 392
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 44
      Width = 36
      Height = 13
      Caption = 'Entidad'
    end
    object Label2: TLabel [2]
      Left = 8
      Top = 76
      Width = 52
      Height = 13
      Caption = 'Descuento'
    end
    object Label3: TLabel [3]
      Left = 8
      Top = 108
      Width = 61
      Height = 13
      Caption = 'Fecha Hasta'
    end
    object Label5: TLabel [4]
      Left = 8
      Top = 12
      Width = 27
      Height = 13
      Caption = 'Canal'
    end
    inherited btnAceptar: TButton
      Left = 243
      Top = 146
      Width = 72
    end
    inherited btnCancelar: TButton
      Left = 323
      Top = 146
      Width = 72
    end
    inline fraEntidad: TfraEntidades
      Left = 80
      Top = 40
      Width = 312
      Height = 23
      TabOrder = 3
      DesignSize = (
        312
        23)
      inherited cmbDescripcion: TArtComboBox
        Width = 247
        DataSource = nil
      end
    end
    object edDescuento: TCurrencyEdit
      Left = 80
      Top = 72
      Width = 88
      Height = 21
      AutoSize = False
      DecimalPlaces = 3
      DisplayFormat = '% ,0.000'
      MaxLength = 12
      TabOrder = 4
    end
    object edFechaHasta: TDateComboBox
      Left = 80
      Top = 104
      Width = 88
      Height = 21
      TabOrder = 5
    end
    inline fraCanal: TfraCanal
      Left = 80
      Top = 8
      Width = 312
      Height = 23
      TabOrder = 2
      DesignSize = (
        312
        23)
      inherited cmbDescripcion: TComboGrid
        Width = 249
        Cells = (
          'C'#243'digo'
          'Descripci'#243'n'
          'Id'
          'Fecha de Baja')
        ColWidths = (
          40
          300
          -1
          -1)
      end
    end
  end
  inherited ShortCutControl: TShortCutControl
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
        Key = 16463
        LinkControl = tbOrdenar
      end
      item
        Key = 16457
        LinkControl = tbImprimir
      end
      item
        Key = 16453
        LinkControl = tbExportar
      end
      item
        Key = 16467
        LinkControl = tbSalir
      end>
  end
end
