{ lib
, boto3
, buildPythonPackage
, fetchFromGitHub
, unittestCheckHook
, redis
}:

buildPythonPackage rec {
  pname = "karton-core";
  version = "5.0.1";

  src = fetchFromGitHub {
    owner = "CERT-Polska";
    repo = "karton";
    rev = "refs/tags/v${version}";
    hash = "sha256-TKO0l0AKsC9MMB58ao/EXcJ9k/J3y3S9tc127H7vA6w=";
  };

  propagatedBuildInputs = [
    boto3
    redis
  ];

  nativeCheckInputs = [ unittestCheckHook ];

  pythonImportsCheck = [
    "karton.core"
  ];

  meta = with lib; {
    description = "Distributed malware processing framework";
    homepage = "https://karton-core.readthedocs.io/";
    license = licenses.bsd3;
    maintainers = with maintainers; [ chivay fab ];
  };
}
