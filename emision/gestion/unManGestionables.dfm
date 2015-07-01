inherited frmManGestionables: TfrmManGestionables
  Left = 346
  Top = 200
  Caption = 'Mantenimiento de Gestionables'
  PixelsPerInch = 96
  TextHeight = 13
  inherited CoolBar: TCoolBar
    inherited ToolBar: TToolBar
      inherited tbNuevo: TToolButton
        Visible = False
      end
      inherited tbEliminar: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'GE_ID'
        Title.Caption = 'N'#250'mero'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GE_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 220
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GE_FECHAALTA'
        Title.Caption = 'Fecha Alta'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GE_USUALTA'
        Title.Caption = 'Usu. Alta'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GE_FECHAMODIF'
        Title.Caption = 'Fecha Modif.'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GE_USUMODIF'
        Title.Caption = 'Usu. Modif.'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GE_FECHABAJA'
        Title.Caption = 'Fecha Baja'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GE_USUBAJA'
        Title.Caption = 'Usu. Baja'
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 124
    Top = 112
    Height = 240
    OnShow = fpAbmShow
    inherited BevelAbm: TBevel
      Top = 204
    end
    object Label1: TLabel [1]
      Left = 9
      Top = 16
      Width = 20
      Height = 13
      Caption = 'Nro.'
    end
    object Label2: TLabel [2]
      Left = 9
      Top = 42
      Width = 56
      Height = 13
      Caption = 'Descripci'#243'n'
    end
    object Label3: TLabel [3]
      Left = 9
      Top = 67
      Width = 57
      Height = 13
      Caption = 'Tipo Detalle'
    end
    object Label4: TLabel [4]
      Left = 9
      Top = 129
      Width = 52
      Height = 13
      Caption = 'Referencia'
    end
    object Label5: TLabel [5]
      Left = 9
      Top = 154
      Width = 52
      Height = 13
      Caption = 'Texto SGC'
    end
    object Label6: TLabel [6]
      Left = 9
      Top = 179
      Width = 21
      Height = 13
      Caption = 'Tipo'
    end
    inherited btnAceptar: TButton
      Top = 210
      TabOrder = 8
    end
    inherited btnCancelar: TButton
      Top = 210
      TabOrder = 9
    end
    object edNroGestion: TIntEdit
      Left = 70
      Top = 13
      Width = 55
      Height = 21
      TabOrder = 0
    end
    object edDescripcion: TEdit
      Left = 70
      Top = 38
      Width = 380
      Height = 21
      TabOrder = 1
    end
    object edTipoDetalle: TEdit
      Left = 70
      Top = 63
      Width = 167
      Height = 21
      TabOrder = 2
    end
    object chkObligatorio: TCheckBox
      Left = 9
      Top = 87
      Width = 74
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Obligatorio'
      TabOrder = 3
    end
    object chkManual: TCheckBox
      Left = 9
      Top = 105
      Width = 74
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Manual'
      TabOrder = 4
    end
    object edReferencia: TEdit
      Left = 70
      Top = 125
      Width = 167
      Height = 21
      TabOrder = 5
    end
    object edTextoSGC: TEdit
      Left = 70
      Top = 150
      Width = 380
      Height = 21
      TabOrder = 6
    end
    object cmbTipo: TExComboBox
      Left = 70
      Top = 175
      Width = 179
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 7
      Items.Strings = (
        'I=Individual'
        'M=Masiva')
      ItemIndex = -1
      Options = []
      ValueWidth = 64
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT   ge_id, ge_descripcion, ge_sqlagestionar, ge_sqlresultad' +
        'o, ge_fechaalta, ge_usualta, ge_fechamodif, ge_usumodif,'
      
        '         ge_fechabaja, ge_usubaja, ge_tipodetallegestion, ge_per' +
        'sisteenreafiliacion, ge_obligatorio, ge_manual, ge_referencia,'
      
        '         ge_texto, ge_sitfacturacion, ge_textositfacturacion, ge' +
        '_tipo,'
      
        '         DECODE(ge_tipodetallegestion, '#39'P'#39', '#39'Per'#237'odo'#39', '#39'C'#39', '#39'Cui' +
        'les'#39', '#39'N'#39', '#39'Notas'#39', '#39'D'#39', '#39'DDJJ'#39') desctipo'
      '    FROM emi.ige_gestionable'
      '   WHERE ge_tipodetallegestion <> '#39'XX'#39
      'ORDER BY ge_id')
  end
end
