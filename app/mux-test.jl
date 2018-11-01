using Mux

@app prueba = (
	Mux.defaults,
	page(respond("<h2>Hola mundo</h2>")),
	page("/acerca",respond("<h2>Acerca</h2>")),
	page("/user/:user", req->"<h1>Hola $(req[:params][:user])</h1>"),
	Mux.notfound(),
)

serve(prueba,"0.0.0.0",8080) # Los parametros son la aplicación, después el host y al final el puerto
