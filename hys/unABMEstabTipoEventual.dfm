inherited frmABMEstabTipoEventual: TfrmABMEstabTipoEventual
  Left = 370
  Top = 204
  Width = 630
  Caption = 'ABM Tipos Establecimientos Eventuales'
  FormStyle = fsNormal
  KeyPreview = True
  OnKeyPress = FSFormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 622
  end
  inherited CoolBar: TCoolBar
    Width = 622
    Bands = <
      item
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 618
      end>
    inherited ToolBar: TToolBar
      Width = 605
      inherited tbModificar: TToolButton
        Caption = 'Altas/Modificaciones'
      end
      inherited ToolButton3: TToolButton
        Visible = False
      end
      inherited tbOrdenar: TToolButton
        Visible = False
      end
      inherited ToolButton6: TToolButton
        Visible = False
      end
      inherited tbImprimir: TToolButton
        Visible = False
      end
      inherited tbExportar: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Width = 622
    Columns = <
      item
        Expanded = False
        FieldName = 'EV_ID'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EV_DESCRIPCION'
        Title.Caption = 'Descripci'#243'n'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EV_ASIGNABLE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'EV_FECHAALTA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'EV_USUALTA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'EV_FECHAMODIF'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'EV_USUMODIF'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'EV_FECHABAJA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'EV_USUBAJA'
        Visible = False
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 140
    Top = 128
    Width = 429
    Height = 93
    Caption = ' '
    BorderIcons = [biSystemMenu]
    OnBeforeShow = fpAbmBeforeShow
    DesignSize = (
      429
      93)
    inherited BevelAbm: TBevel
      Top = 57
      Width = 421
    end
    object Label1: TLabel [1]
      Left = 4
      Top = 12
      Width = 57
      Height = 13
      Caption = 'C'#243'digo Tipo'
    end
    inherited btnAceptar: TButton
      Left = 271
      Top = 63
      Default = True
      TabOrder = 2
    end
    inherited btnCancelar: TButton
      Left = 349
      Top = 63
      TabOrder = 3
      OnClick = btnCancelarClick
    end
    object chkAsignable: TCheckBox
      Left = 68
      Top = 31
      Width = 141
      Height = 17
      Caption = 'Asignable a Preventores'
      TabOrder = 1
    end
    object edDescrip: TEdit
      Left = 144
      Top = 8
      Width = 277
      Height = 21
      TabOrder = 0
    end
    object edCodigo: TEdit
      Left = 68
      Top = 8
      Width = 73
      Height = 21
      TabOrder = 4
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      'SELECT  *  FROM  hys.pev_estabeventual')
  end
end
