inherited frmManPermisosStockMateriales: TfrmManPermisosStockMateriales
  Left = 579
  Top = 353
  Caption = 
    'Administracion Permisos Usuario Mantenimiento Stock de Materiale' +
    's'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid: TArtDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'um_usuario'
        Title.Caption = 'Usuario'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'de_descripcion'
        Title.Caption = 'Dep'#243'sito'
        Width = 149
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'um_alta'
        Title.Caption = 'Alta'
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'um_ajuste'
        Title.Caption = 'Ajuste'
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'um_movimiento'
        Title.Caption = 'Mov.D'
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'um_entrega'
        Title.Caption = 'Entrega'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'um_devolucion'
        Title.Caption = 'Devol.'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'um_fechaalta'
        Title.Caption = 'Fecha Alta'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'um_usualta'
        Title.Caption = 'Usu. Alta'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'um_fechamodif'
        Title.Caption = 'Fecha Modif.'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'um_usumodif'
        Title.Caption = 'Usu. Modif'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'um_fechabaja'
        Title.Caption = 'Fecha Baja'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'um_usubaja'
        Title.Caption = 'Usu. Baja'
        Width = 96
        Visible = True
      end>
  end
  inherited fpAbm: TFormPanel
    Left = 112
    Width = 405
    Height = 225
    inherited BevelAbm: TBevel
      Top = 189
      Width = 397
    end
    object Label1: TLabel [1]
      Left = 16
      Top = 12
      Width = 36
      Height = 13
      Caption = 'Usuario'
    end
    object Label2: TLabel [2]
      Left = 12
      Top = 36
      Width = 42
      Height = 13
      Caption = 'Dep'#243'sito'
    end
    inherited btnAceptar: TButton
      Left = 247
      Top = 195
      TabOrder = 7
    end
    inherited btnCancelar: TButton
      Left = 325
      Top = 195
      TabOrder = 8
    end
    object chkAlta: TCheckBox
      Left = 56
      Top = 64
      Width = 97
      Height = 17
      Caption = 'Alta'
      TabOrder = 2
    end
    object chkAjuste: TCheckBox
      Left = 56
      Top = 88
      Width = 97
      Height = 17
      Caption = 'Ajuste'
      TabOrder = 3
    end
    object chkMovEntreDepositos: TCheckBox
      Left = 56
      Top = 112
      Width = 145
      Height = 17
      Caption = 'Mov. Entre Dep'#243'sitos'
      TabOrder = 4
    end
    object chkEntregaMateriales: TCheckBox
      Left = 56
      Top = 136
      Width = 125
      Height = 17
      Caption = 'Entrega de Materiales'
      TabOrder = 5
    end
    object chkDevolucion: TCheckBox
      Left = 56
      Top = 160
      Width = 97
      Height = 17
      Caption = 'Devoluci'#243'n'
      TabOrder = 6
    end
    inline fraDeposito: TfraStaticCodigoDescripcion
      Left = 56
      Top = 32
      Width = 345
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      inherited edCodigo: TPatternEdit
        Width = 80
      end
      inherited cmbDescripcion: TComboGrid
        Left = 84
        Width = 261
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
    inline fraUsuarios: TfraUsuario
      Left = 56
      Top = 8
      Width = 345
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      inherited cmbDescripcion: TArtComboBox
        Width = 261
      end
    end
  end
end
