class HomeController < ApplicationController
  def index
    @protocolo = "Meridian"

    # Métricas del protocolo (en una app real vendrían de la cadena / API).
    @stats = [
      { n: "$7B+",  l: "En activos gestionados" },
      { n: "24/7",  l: "Soporte al cliente" },
      { n: "200+",  l: "Jurisdicciones" }
    ]

    # Bloques de producto.
    @features = [
      { icono: "grow",  titulo: "Haz crecer tus ahorros",  desc: "Abre una cuenta y gana hasta 15% anual sobre tus criptos, con pagos diarios y sin bloqueos." },
      { icono: "swap",  titulo: "Gestiona tus activos",    desc: "Intercambia más de 100 activos y consigue liquidez con una línea de crédito respaldada por cripto." },
      { icono: "card",  titulo: "Gasta en cualquier lugar", desc: "Compra sin vender tus criptos y recibe hasta 2% de reintegro con la Meridian Card." }
    ]

    # Tabla de mercados (precio + variación 24h + APY).
    @mercados = [
      { activo: "Bitcoin",  ticker: "BTC",  simbolo: "₿", precio: "$67.820,50", cambio: 3.21,  apy: 3.4 },
      { activo: "Ethereum", ticker: "ETH",  simbolo: "Ξ", precio: "$3.512,45",  cambio: 5.08,  apy: 4.7 },
      { activo: "Solana",   ticker: "SOL",  simbolo: "◎", precio: "$165,35",    cambio: 6.35,  apy: 6.2 },
      { activo: "Tether",   ticker: "USDT", simbolo: "₮", precio: "$1,00",      cambio: 0.01,  apy: 8.1 },
      { activo: "USD Coin", ticker: "USDC", simbolo: "$", precio: "$0,9998",    cambio: -0.02, apy: 8.15 },
      { activo: "XRP",      ticker: "XRP",  simbolo: "✕", precio: "$0,52",      cambio: 2.14,  apy: 2.1 }
    ]
  end
end
