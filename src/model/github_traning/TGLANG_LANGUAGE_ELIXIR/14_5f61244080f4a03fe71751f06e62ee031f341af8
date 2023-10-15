# kill prev run
:os.cmd('docker ps -q | xargs docker kill')
:os.cmd('pkill -f curl')

Process.sleep(1000)

:os.cmd('docker run --cpuset-cpus=0-1 --rm -d -p 127.0.0.1:8080:5000 -e PORT=5000 embedding -c 4000 --embedding --host 0.0.0.0 --port 5000')
:os.cmd('docker run --cpuset-cpus=2-3 --rm -d -p 127.0.0.1:8081:5000 -e PORT=5000 embedding -c 4000 --embedding --host 0.0.0.0 --port 5000')
:os.cmd('docker run --cpuset-cpus=4-5 --rm -d -p 127.0.0.1:8082:5000 -e PORT=5000 embedding -c 4000 --embedding --host 0.0.0.0 --port 5000')
:os.cmd('docker run --cpuset-cpus=6-7 --rm -d -p 127.0.0.1:8083:5000 -e PORT=5000 embedding -c 4000 --embedding --host 0.0.0.0 --port 5000')
:os.cmd('docker run --cpuset-cpus=8-9 --rm -d -p 127.0.0.1:8084:5000 -e PORT=5000 embedding -c 4000 --embedding --host 0.0.0.0 --port 5000')
:os.cmd('docker run --cpuset-cpus=10-11 --rm -d -p 127.0.0.1:8085:5000 -e PORT=5000 embedding -c 4000 --embedding --host 0.0.0.0 --port 5000')
:os.cmd('docker run --cpuset-cpus=18-19 --rm -d -p 127.0.0.1:8086:5000 -e PORT=5000 embedding -c 4000 --embedding --host 0.0.0.0 --port 5000')
:os.cmd('docker run --cpuset-cpus=30-31 --rm -d -p 127.0.0.1:8087:5000 -e PORT=5000 embedding -c 4000 --embedding --host 0.0.0.0 --port 5000')


Process.sleep(3000)

defmodule Loop do
  @moduledoc "Sends random strings to the server"
  @chars String.split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZäöüÄÖÜß", "")

  def run(port) do
    System.cmd("curl", ["--silent", "--location", "--request", "POST" , "http://127.0.0.1:#{port}/embedding", "--header", "Content-Type: application/json", "--data-raw", "{\"content\": \"#{rand_string()}\"}"])

    run(port)
  rescue
    _ -> run(port)
  end

  def rand_string do
    1..3000 |> Enum.map_join("", fn _ -> Enum.random(@chars) end)
  end
end

8080..8087 |> Enum.each(fn port -> spawn(fn -> Loop.run(port) end) end)

Process.sleep(:infinity)
