ARG PY_VER=3.8
ARG DISTRO=alpine
ARG IMAGE=djlab
FROM datajoint/${IMAGE}:py${PY_VER}-${DISTRO}
COPY --chown=anaconda:anaconda requirements.txt $PIP_REQUIREMENTS
COPY --chown=anaconda:anaconda requirements_apk.txt $APK_REQUIREMENTS
RUN \
  /entrypoint.sh echo "Requirements updated..." && \
  rm "$APK_REQUIREMENTS" && \
  rm "$PIP_REQUIREMENTS"
USER root
RUN update-ms-fonts
USER anaconda:anaconda
