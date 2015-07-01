object fraDetalleArchivo: TfraDetalleArchivo
  Left = 0
  Top = 0
  Width = 496
  Height = 440
  TabOrder = 0
  DesignSize = (
    496
    440)
  object gbDetalleArchivo: TGroupBox
    Left = 0
    Top = 0
    Width = 496
    Height = 275
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = ' Detalle '
    TabOrder = 0
    DesignSize = (
      496
      275)
    object lblTipoArchivo: TLabel
      Left = 9
      Top = 19
      Width = 49
      Height = 13
      Caption = 'T.Archivo:'
    end
    object lblUbicacion: TLabel
      Left = 9
      Top = 43
      Width = 51
      Height = 13
      Caption = 'Ubicaci'#243'n:'
    end
    object lblCaja: TLabel
      Left = 9
      Top = 68
      Width = 24
      Height = 13
      Caption = 'Caja:'
    end
    object lblEmisor: TLabel
      Left = 9
      Top = 94
      Width = 34
      Height = 13
      Caption = 'Emisor:'
    end
    object lblReceptor: TLabel
      Left = 249
      Top = 94
      Width = 47
      Height = 13
      Caption = 'Receptor:'
    end
    object lblDescriptor: TLabel
      Left = 9
      Top = 120
      Width = 42
      Height = 13
      Caption = 'Descrip.:'
    end
    object lblFechaMovimiento: TLabel
      Left = 12
      Top = 148
      Width = 36
      Height = 13
      Caption = 'F.Mov.:'
    end
    object lblFechaVencimiento: TLabel
      Left = 171
      Top = 148
      Width = 70
      Height = 13
      Caption = 'F.Vencimiento:'
    end
    object Label1: TLabel
      Left = 8
      Top = 167
      Width = 74
      Height = 13
      Caption = 'Observaciones:'
    end
    object edTipoArchivo: TEdit
      Left = 64
      Top = 16
      Width = 421
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = 15724780
      ReadOnly = True
      TabOrder = 0
    end
    object edTipoUbicacion: TEdit
      Left = 64
      Top = 40
      Width = 217
      Height = 21
      Color = 15724780
      ReadOnly = True
      TabOrder = 1
    end
    object edUbicacion: TEdit
      Left = 288
      Top = 40
      Width = 197
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = 15724780
      ReadOnly = True
      TabOrder = 2
    end
    object edCaja: TEdit
      Left = 64
      Top = 65
      Width = 78
      Height = 21
      Color = 15724780
      ReadOnly = True
      TabOrder = 3
    end
    object edEmisor: TEdit
      Left = 64
      Top = 91
      Width = 169
      Height = 21
      Color = 15724780
      ReadOnly = True
      TabOrder = 4
    end
    object edtRecepctor: TEdit
      Left = 304
      Top = 91
      Width = 181
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = 15724780
      ReadOnly = True
      TabOrder = 5
    end
    object edtDescripcion: TEdit
      Left = 64
      Top = 117
      Width = 421
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = 15724780
      ReadOnly = True
      TabOrder = 6
    end
    object edFechaMovimiento: TDateComboBox
      Left = 64
      Top = 143
      Width = 88
      Height = 21
      Color = 15724780
      ReadOnly = True
      TabOrder = 7
    end
    object edFechaVencimiento: TDateComboBox
      Left = 247
      Top = 143
      Width = 88
      Height = 21
      Color = 15724780
      ReadOnly = True
      TabOrder = 8
    end
    object tbDetalleDescripcion: TToolBar
      Left = 458
      Top = 139
      Width = 30
      Height = 27
      Align = alNone
      Anchors = [akTop, akRight]
      BorderWidth = 1
      ButtonWidth = 25
      Caption = 'ToolBar'
      EdgeBorders = []
      Flat = True
      HotImages = frmPrincipal.ilByN
      Images = frmPrincipal.ilColor
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      object tbMostrarImagenBank: TToolButton
        Left = 0
        Top = 0
        Caption = 'tbDetalleEvento'
        ImageIndex = 14
        Visible = False
      end
    end
    object edObservaciones: TMemo
      Left = 7
      Top = 182
      Width = 481
      Height = 85
      Anchors = [akLeft, akTop, akRight]
      Color = 15724780
      Lines.Strings = (
        '')
      ReadOnly = True
      TabOrder = 9
    end
  end
  object gbDetalleSolicitudActiva: TGroupBox
    Left = 0
    Top = 276
    Width = 496
    Height = 162
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = ' Solicitud Pendiente '
    TabOrder = 1
    DesignSize = (
      496
      162)
    object lblUsuarioSolicitud: TLabel
      Left = 8
      Top = 24
      Width = 39
      Height = 13
      Caption = 'Usuario:'
    end
    object lblFechaSolicitud: TLabel
      Left = 316
      Top = 24
      Width = 76
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Fecha Solicitud:'
    end
    object lblTipoSolicitud: TLabel
      Left = 8
      Top = 48
      Width = 24
      Height = 13
      Caption = 'Tipo:'
    end
    object lblMotivoSolicitud: TLabel
      Left = 8
      Top = 72
      Width = 78
      Height = 13
      Caption = 'Motivo Solicitud:'
    end
    object edFechaSolicitud: TDateComboBox
      Left = 397
      Top = 20
      Width = 88
      Height = 21
      Color = 15724780
      Anchors = [akTop, akRight]
      ReadOnly = True
      TabOrder = 0
    end
    object edUsuarioSolicitud: TEdit
      Left = 51
      Top = 21
      Width = 232
      Height = 21
      Color = 15724780
      ReadOnly = True
      TabOrder = 1
    end
    object edTipoSolicitud: TEdit
      Left = 51
      Top = 46
      Width = 232
      Height = 21
      Color = 15724780
      ReadOnly = True
      TabOrder = 2
    end
    object mMotivoSolicitud: TMemo
      Left = 7
      Top = 87
      Width = 481
      Height = 68
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = 15724780
      Lines.Strings = (
        '')
      ReadOnly = True
      TabOrder = 3
    end
  end
end
