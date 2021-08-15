package com.example.SpringProg.config;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;


@Configuration
public class AmazonConfig {

    @Value("AKIAXJNB7PKMCJFK2BUH")
private String accessKey;


    @Value("1WhnByeYcl66PoAwElWDemQhDs22fA82jO005to/")
private String accessSecret;


@Value("eu-north-1")
private String accessRegion;


@Bean
public AmazonS3 generateS3Client(){
    AWSCredentials credentials = new BasicAWSCredentials(accessKey,accessSecret);
    return AmazonS3ClientBuilder
            .standard()
            .withCredentials(new AWSStaticCredentialsProvider(credentials))
            .withRegion(accessRegion)
            .build();
}


}
