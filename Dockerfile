FROM python:3.6-alpine
RUN apk update
RUN apk add gcc python3-dev musl-dev \
    && apk add postgresql-dev postgresql-client
RUN apk add linux-headers
RUN apk add jpeg-dev zlib-dev freetype-dev lcms2-dev openjpeg-dev tiff-dev tk-dev tcl-dev \
    # CFFI dependencies
    && apk add libffi-dev py-cffi \
    # Translations dependenices
    && apk add gettext g++
RUN apk add build-base
RUN apk add libxml2-dev libxslt-dev
RUN mkdir /app
WORKDIR /app
ADD requirements.txt /app/
RUN pip install -r requirements.txt
ADD . /app/
