# OilFetcher

Гем тащит цену на нефть [отсюда](https://www.quandl.com/api/v1/datasets/CHRIS/ICE_B1.json?rows=1)

## Установка

В Gemfile:

    gem 'oil_fetcher'

Или вручную:

    $ gem install oil_fetcher

## Как пользоваться

    OilFetcher.call

Вернет объект:

    #<OilFetcher::Oil:0x007fd9739de168 @rate=53.47, @date=#<Date: 2015-07-27 ((2457231j,0s,0n),+0s,2299161j)>>

`@rate` - цена на нефть
`@date` - дата

## Конфигурация

    OilFetcher.configure |config| do
      config.uri = "www.example.com"
      config.logger = mylogger
    end

Ожидается, что по адресу `uri` будет json вида

    {
      "errors": {},
      "id": 11251692,
      "source_name": "Wiki Continuous Futures",
      "source_code": "CHRIS",
      "code": "ICE_B1",
      "name": "Brent Crude Futures, Continuous Contract #1 (B1) (Front Month)",
      "urlize_name": "Brent-Crude-Futures-Continuous-Contract-1-B1-Front-Month",
      "display_url": "http://www.ofdp.org",
      "description": "Historical Futures Prices: Brent Crude Futures, Continuous Contract #1. Non-adjusted price based on spot-month continuous contract calculations. Raw data from ICE. For more on the roll algorithm used please see this page: https://www.quandl.com/collections/futures/continuous.",
      "updated_at": "2015-07-28T04:25:51.455Z",
      "frequency": "daily",
      "from_date": "1990-08-17",
      "to_date": "2015-07-27",
      "column_names": [
        "Date",
        "Open",
        "High",
        "Low",
        "Settle",
        "Change",
        "Wave",
        "Volume",
        "Prev. Day Open Interest",
        "EFP Volume",
        "EFS Volume",
        "Block Volume"
      ],
      "private": false,
      "type": null,
      "premium": false,
      "data": [
        [
          "2015-07-27",
          54.45,
          54.89,
          52.83,
          53.47,
          -1.15,
          53.8,
          217196,
          313552,
          3402,
          null,
          5775
        ]
      ]
    }

По дефолту `uri = "https://www.quandl.com/api/v1/datasets/CHRIS/ICE_B1.json?rows=1"`.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

