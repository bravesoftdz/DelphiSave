inherited frmPersonasEntrevistadas: TfrmPersonasEntrevistadas
  VertScrollBar.Range = 0
  BorderStyle = bsNone
  Caption = 'Personas Entrevistadas'
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited CoolBar: TCoolBar
    inherited ToolBar: TToolBar
      inherited tbSalir: TToolButton
        Visible = False
      end
    end
  end
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'PE_NOMBRE'
        Title.Caption = 'Nombre'
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PE_CARGO'
        Title.Caption = 'Cargo'
        Width = 186
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Height = 103
    inherited BevelAbm: TBevel
      Top = 67
    end
    object lbNombre: TLabel [1]
      Left = 8
      Top = 15
      Width = 40
      Height = 13
      Caption = 'Nombre:'
    end
    object lbCargo: TLabel [2]
      Left = 8
      Top = 39
      Width = 31
      Height = 13
      Caption = 'Cargo:'
    end
    inherited btnAceptar: TButton
      Top = 73
    end
    inherited btnCancelar: TButton
      Top = 73
    end
    object edNombre: TEdit
      Left = 72
      Top = 12
      Width = 369
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 100
      TabOrder = 2
    end
    object edCargo: TEdit
      Left = 72
      Top = 36
      Width = 369
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 250
      TabOrder = 3
    end
  end
  inherited sdqConsulta: TSDQuery
    SQL.Strings = (
      
        'SELECT pe_id, pe_nombre, pe_cargo, pe_usualta, pe_fechaalta, pe_' +
        'usumodif, pe_fechamodif, pe_usubaja, pe_fechabaja,'
      '       pe_idergonomia'
      '  FROM hys.hpe_personasentrevistadaserg'
      ' WHERE pe_idergonomia = :idergonomia')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idergonomia'
        ParamType = ptInput
      end>
  end
end
