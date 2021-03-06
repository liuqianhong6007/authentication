package api

import (
	"github.com/liuqianhong6007/authentication/internal"
	"net/http"

	"github.com/gin-gonic/gin"
)

func init() {
	internal.AddRoute(internal.Routes{
		{
			Method:  http.MethodGet,
			Path:    "/auth/ping",
			Handler: ping,
		},
	})
}

func ping(c *gin.Context) {
	internal.SuccessJsonRsp(c, nil)
}
