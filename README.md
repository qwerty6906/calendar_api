# CALENDAR API

## METHODS
* GET /events - возвращает JSON с массивом всех не наступивших событий
> [{"title":"Test Event","begin":"2018-06-26T14:15:00.000Z","end":"2018-06-26T14:30:00.000Z"},{"title":"Event 1","begin":"2018-07-07T11:47:14.021Z","end":"2018-07-07T14:47:14.021Z"}]

* POST /events - тело запросто должно содержать JSON следующего вида
> {
  "event": {
    "title": "Test Event",
    "begin": "2018-06-26T14:15:00.000Z",
    "end": "2018-06-26T14:30:00.000Z"
  }
}

## AUTHENTICATION
Для аутентификации в заголовке Authorization необходимо передать JWT вида
> Bearer #{token}

### Tokens
Ivan: eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOjEsImV4cCI6MTU2MTI5OTM2MH0.fW_YZm1HKFDAEKenbckrvXxIAF51c2UPNq04djZKYIk
Anton: eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOjIsImV4cCI6MTU2MTI5OTM3OH0.7CZgRCBh89jxRdMQG_dGHS3yINyJHTFXyiF96Oy3ekk