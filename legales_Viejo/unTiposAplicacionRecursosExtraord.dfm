inherited frmTiposAplicacionRecursosExtraord: TfrmTiposAplicacionRecursosExtraord
  Left = 91
  Top = 73
  Width = 600
  Height = 500
  Caption = 'Tipos de Aplicaci'#243'n de Recursos Extraordinarios'
  Constraints.MinHeight = 500
  Constraints.MinWidth = 600
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 592
  end
  inherited CoolBar: TCoolBar
    Width = 592
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 588
      end>
    inherited ToolBar: TToolBar
      Width = 575
      inherited tbModificar: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Width = 592
    Height = 399
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Title.Caption = 'C'#243'digo'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Width = 329
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'OPERACION'
        Title.Alignment = taCenter
        Title.Caption = 'Operaci'#243'n'
        Width = 57
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 120
    Top = 164
    Height = 166
    BorderStyle = bsSingle
    inherited BevelAbm: TBevel
      Top = 130
    end
    object Label1: TLabel [1]
      Left = 7
      Top = 10
      Width = 60
      Height = 13
      AutoSize = False
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel [2]
      Left = 7
      Top = 38
      Width = 60
      Height = 13
      AutoSize = False
      Caption = 'Descripci'#243'n'
    end
    inherited btnAceptar: TButton
      Top = 136
      TabOrder = 3
    end
    inherited btnCancelar: TButton
      Top = 136
      TabOrder = 4
    end
    object edCodigoAlta: TPatternEdit
      Left = 69
      Top = 8
      Width = 35
      Height = 21
      MaxLength = 2
      TabOrder = 0
      Pattern = '0123456789'
    end
    object edDescripcionAlta: TEdit
      Left = 69
      Top = 36
      Width = 384
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 60
      TabOrder = 1
    end
    object rgOperacionAlta: TRadioGroup
      Left = 69
      Top = 61
      Width = 185
      Height = 65
      Caption = 'Operaci'#243'n'
      Items.Strings = (
        'Suma'
        'Resta')
      TabOrder = 2
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT TR_ID TRID, TR_CODIGO CODIGO, TR_DESCRIPCION DESCRIPCION,' +
        ' '
      
        '       DECODE(TR_OPERACION, 1, '#39'+'#39', '#39'-'#39') OPERACION, TR_FECHABAJA' +
        ' FECHABAJA '
      '  FROM LTR_TIPOAPLICACIONRECEXT')
  end
  inherited QueryPrint: TQueryPrint
    LastColType = lcFill
    PageOrientation = pxPortrait
    PageSize = psLetter
  end
end
