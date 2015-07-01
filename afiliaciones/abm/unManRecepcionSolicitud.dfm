inherited frmManRecepcionSolicitud: TfrmManRecepcionSolicitud
  Left = 370
  Top = 160
  Caption = 'Mantenimiento Recepci'#243'n de Solicitud'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'sr_usuario'
        Title.Caption = 'Usuario'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sr_cantidad'
        Title.Caption = 'Cantidad'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tipo_prioridad'
        Title.Caption = 'Prioridad'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'alta_licencia'
        Title.Caption = 'Alta de Licencia'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sr_periodobaja'
        Title.Caption = 'Per. Baja'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sr_periodoalta'
        Title.Caption = 'Per. Alta'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sr_usualta'
        Title.Caption = 'Usr. Carga'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sr_fechaalta'
        Title.Caption = 'Fecha Carga.'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sr_usumodif'
        Title.Caption = 'Usuario Modificaci'#243'n'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sr_fechamodif'
        Title.Caption = 'Fecha Modificaci'#243'n'
        Width = 100
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 96
    Top = 168
    Height = 145
    inherited BevelAbm: TBevel
      Top = 109
    end
    object Label2: TLabel [1]
      Left = 8
      Top = 64
      Width = 72
      Height = 13
      Caption = 'Per'#237'odo Desde'
    end
    object Label1: TLabel [2]
      Left = 248
      Top = 64
      Width = 28
      Height = 13
      Caption = 'Hasta'
    end
    object Label3: TLabel [3]
      Left = 8
      Top = 40
      Width = 36
      Height = 13
      Caption = 'Usuario'
    end
    inherited btnAceptar: TButton
      Top = 115
    end
    inherited btnCancelar: TButton
      Top = 115
    end
    object edFechaDesde: TDateComboBox
      Left = 128
      Top = 60
      Width = 105
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 2
    end
    object edFechaHasta: TDateComboBox
      Left = 284
      Top = 60
      Width = 105
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 3
    end
    inline fraUsuarioAsignado: TfraUsuarios
      Left = 128
      Top = 33
      Width = 329
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      inherited cmbDescripcion: TArtComboBox
        Width = 236
        DataSource = nil
      end
    end
    object chkPrioridad: TCheckBox
      Left = 308
      Top = 8
      Width = 137
      Height = 17
      Caption = 'Usuario con Prioridad'
      TabOrder = 5
    end
    object chkAltaLicencia: TCheckBox
      Left = 128
      Top = 8
      Width = 137
      Height = 17
      Caption = 'Alta de Licencia'
      TabOrder = 6
    end
    object chkAlinear: TCheckBox
      Left = 128
      Top = 88
      Width = 177
      Height = 17
      Caption = 'Alinear la cantidad a los dem'#225's'
      TabOrder = 7
    end
  end
end
