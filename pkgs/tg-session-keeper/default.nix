{ lib, python3Packages, fetchFromGitHub, substituteAll }:

python3Packages.buildPythonPackage rec {
  pname = "tg-session-keeper";
  version = "0.1.2";

  src = fetchFromGitHub {
    owner = "DavisDmitry";
    repo = pname;
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  propagatedBuildInputs = with python3Packages; [
    python3
    cryptography
    tabulate
    telethon
  ];

  doCheck = false;
  pythonImportsCheck = [ "tg-session-keeper" ];

  meta = with lib; {
    mainProgram = "${pname}";
    homepage = "https://github.com/DavisDmitry/tg-session-keeper";
    description = "CLI utility for keeping Telegram sessions.";
    license = licenses.mit;
    platforms = platforms.linux;
    maintainers = [ ];
  };
}
