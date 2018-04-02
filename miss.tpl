Key:Foo:{{key "foo"}}
MissingKey:{{if keyExists "MissingKey"}}{{key "MissingKey"}}{{else}}nothing{{end}}
DefaultValue:{{keyOrDefault "Duffer" ""}}
