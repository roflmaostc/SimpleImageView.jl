### A Pluto.jl notebook ###
# v0.19.14

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local iv = try Base.loaded_modules[Base.PkgId(Base.UUID("6e696c72-6542-2067-7265-42206c756150"), "AbstractPlutoDingetjes")].Bonds.initial_value catch; b -> missing; end
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : iv(el)
        el
    end
end

# ╔═╡ 6b75cf1a-603b-11ed-37ee-d7f2b17aadb4
using Pkg

# ╔═╡ 5e235e78-dcaf-448b-9e56-5e9ead1e4ce7
Pkg.activate(".")

# ╔═╡ 58407289-ce99-4e8e-a52b-2dee09c225a0
using Revise, SimpleImageView, Colors, PlutoUI, FFTW

# ╔═╡ f81c408a-9677-4c3d-9a14-b0bca324f8f9
using TestImages

# ╔═╡ cfbce045-5191-459d-8417-fd98cba6e0a6
md"## Load an image"

# ╔═╡ ed6d1620-baa1-4907-a582-467b5506b84c
img = testimage("mandril_gray");

# ╔═╡ 7f8e71ad-9df5-4d64-b981-bfd527ea4c4b
arr = Float32.(testimage("mandril_gray"));

# ╔═╡ b3ac88ae-537c-4d4b-9d05-265920cbe5fa
md"## This works already with Colors"

# ╔═╡ 3653f52f-056b-4fae-8962-992643970f34
Gray.(arr)

# ╔═╡ 4d7837d8-0a34-4cfc-a8b0-e7fa9dd93e02
md"## Let's pimp it with `simshow`
Look at the help with `?simshow`
"

# ╔═╡ 6ed33866-d441-4abb-96a4-39862d94d03c
simshow

# ╔═╡ 60964d5d-90df-46c6-8bd8-c2e92cec2204
simshow(img)

# ╔═╡ 18952447-7a83-4551-b033-09cffc7487ea
md"## with arrays"

# ╔═╡ 9b2925c0-3e2d-4e8f-a146-4bb28a75654a
simshow(arr)

# ╔═╡ 1b39eec1-6b97-4718-a989-873f06e91be9
md"## More Pluto features included
Change the γ
"

# ╔═╡ 164134c4-dc6c-47b6-ad7f-40db9898c055
md"γ = $(@bind γ Slider(0.1:0.1:4, show_value=true))"

# ╔═╡ 951cc324-e63e-4122-ab94-250fad83afe6
simshow(arr, γ=γ)

# ╔═╡ 4c358769-2e61-4463-97de-7cfa8a0e605e
md"# Pass a function
To increase the contrast or ...
"

# ╔═╡ 4ba38e5e-1d80-4d57-afb4-e281c1746643
simshow(arr,  f = x -> log.(0.5 .+ x))

# ╔═╡ 00a9d5d5-8353-4e91-962a-2a0068696300
md"## Complex numbers!

Amplitude is encoded as brightness, phase as a continous color map, mapping the values from 0 to 2π to a color
"

# ╔═╡ 703e2573-e0ca-4730-8746-4c07bcc8cb80
arr2 = Float32.(Gray.(testimage("fabio_gray_512")));

# ╔═╡ 270fe924-6cb0-4571-a537-9b262f69651b
md"absγ = $(@bind absγ Slider(0.1:0.1:4, show_value=true))"

# ╔═╡ f9bcc245-0691-49f7-8f2e-fd6cda4f9adf
simshow(arr .* exp.(1im .* 2π .* arr2); absγ)

# ╔═╡ a2d97aab-78c3-40f7-8db1-14b5f4004023
md"## Apply a function to the complex valued array
Such as the FFT
"

# ╔═╡ 28238d7c-c505-432a-b901-3bb411ed0b62
simshow(arr .* exp.(1im .* 2π .* arr2); f=x -> fftshift(fft(x)), absγ=0.1)

# ╔═╡ Cell order:
# ╠═6b75cf1a-603b-11ed-37ee-d7f2b17aadb4
# ╠═5e235e78-dcaf-448b-9e56-5e9ead1e4ce7
# ╠═58407289-ce99-4e8e-a52b-2dee09c225a0
# ╠═f81c408a-9677-4c3d-9a14-b0bca324f8f9
# ╟─cfbce045-5191-459d-8417-fd98cba6e0a6
# ╠═ed6d1620-baa1-4907-a582-467b5506b84c
# ╠═7f8e71ad-9df5-4d64-b981-bfd527ea4c4b
# ╟─b3ac88ae-537c-4d4b-9d05-265920cbe5fa
# ╠═3653f52f-056b-4fae-8962-992643970f34
# ╟─4d7837d8-0a34-4cfc-a8b0-e7fa9dd93e02
# ╠═6ed33866-d441-4abb-96a4-39862d94d03c
# ╠═60964d5d-90df-46c6-8bd8-c2e92cec2204
# ╟─18952447-7a83-4551-b033-09cffc7487ea
# ╠═9b2925c0-3e2d-4e8f-a146-4bb28a75654a
# ╟─1b39eec1-6b97-4718-a989-873f06e91be9
# ╠═164134c4-dc6c-47b6-ad7f-40db9898c055
# ╠═951cc324-e63e-4122-ab94-250fad83afe6
# ╟─4c358769-2e61-4463-97de-7cfa8a0e605e
# ╠═4ba38e5e-1d80-4d57-afb4-e281c1746643
# ╟─00a9d5d5-8353-4e91-962a-2a0068696300
# ╠═703e2573-e0ca-4730-8746-4c07bcc8cb80
# ╠═f9bcc245-0691-49f7-8f2e-fd6cda4f9adf
# ╠═270fe924-6cb0-4571-a537-9b262f69651b
# ╟─a2d97aab-78c3-40f7-8db1-14b5f4004023
# ╠═28238d7c-c505-432a-b901-3bb411ed0b62
