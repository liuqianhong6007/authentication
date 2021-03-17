FROM golang:1.15-alpine As gobuilder
ENV GOPROXY https://goproxy.cn
COPY . /go/authentication/
RUN cd /go/authentication && CGO_ENABLED=0 go build

FROM alpine:3.13.2
EXPOSE 8081
WORKDIR /app
COPY --from=gobuilder /go/authentication/auth.yaml /app/auth.yaml
COPY --from=gobuilder /go/authentication/rbac_model.conf /app/rbac_model.conf
COPY --from=gobuilder /go/authentication/rbac_policy.csv /app/rbac_policy.csv
COPY --from=gobuilder /go/authentication/authentication /app/authentication
CMD ["./authentication"]