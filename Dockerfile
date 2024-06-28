FROM gcc:latest
WORKDIR /TML_CCP_Code
COPY  . .
RUN g++ -o TML_code LAMP.cpp
CMD ["./TML_code"]
