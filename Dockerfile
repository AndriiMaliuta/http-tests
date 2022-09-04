# Cabal
FROM haskell:8.10
RUN cabal update && cabal install pandoc citeproc
ENTRYPOINT ["pandoc"]

## Stack
# FROM haskell:8.10
# RUN stack install --resolver lts-17.14 pandoc citeproc
# ENTRYPOINT ["pandoc"]