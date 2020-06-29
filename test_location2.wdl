workflow test_location {
    call find_tools
}

task find_tools {
    command <<<
        ls -l /data/HG19_ROOT/hg19_random.fa
        echo "@@@@@@@@@@@@@"
    >>>
    output{
        String message = read_string(stdout())
    }
    runtime {
        docker: "g3chen/wgsmetrics@sha256:5517c524bd0d3b39273b0ac4e16a52fc94b8d9c2c787e79a548183a1acc08670"
    }
}
