FROM        golang:1.10.1-alpine3.7

MAINTAINER  Steve McQuaid <steve@stevemcquaid.com>

ENV         VERSION=0.2.0

RUN         apk update && apk upgrade && \
            apk add --no-cache bash git

WORKDIR     /go/src/app

# Caching large packages to speed up build
#RUN go-wrapper download -u github.com/golang/glog

RUN     go get -d -v "golang.org/x/tools/cmd/present"

RUN     go install golang.org/x/tools/cmd/present

COPY    . .

# RUN go get -d -v ./...

# RUN go install -v ./...

CMD     ["present"]
