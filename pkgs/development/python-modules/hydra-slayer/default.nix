{ lib
, buildPythonPackage
, fetchPypi
, poetry-core
, pytestCheckHook
}:

buildPythonPackage rec {
  pname = "hydra-slayer";
  version = "0.4.0";
  format = "pyproject";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-Ln7wuZ5eEVBNgJlvaJ7V7Xrodm7bjna2kzswaWYVlgQ=";
  };

  nativeBuildInputs = [
    poetry-core
  ];

  nativeCheckInputs = [
    pytestCheckHook
  ];

  pythonImportsCheck = [
    "hydra_slayer"
  ];

  meta = with lib; {
    description = "PyTorch library for configuring complex applications";
    homepage = "https://github.com/catalyst-team/hydra-slayer";
    license = licenses.asl20;
    maintainers = with maintainers; [ YodaEmbedding ];
  };
}
