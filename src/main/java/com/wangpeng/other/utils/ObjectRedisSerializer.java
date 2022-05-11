package com.wangpeng.other.utils;

import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.data.redis.serializer.SerializationException;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

/**
 * @Author: 王鹏
 * @Date: 2022/03/20/19:21
 * @Description:
 */
public class ObjectRedisSerializer implements RedisSerializer<Object> {

    @Override
    public byte[] serialize(Object o) throws SerializationException {

        try (ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
             ObjectOutputStream objectOutputStream = new ObjectOutputStream(outputStream);) {
            objectOutputStream.writeObject(o);
            objectOutputStream.flush();
            byte[] bytes = outputStream.toByteArray();
            return bytes;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return new byte[0];
    }

    @Override
    public Object deserialize(byte[] bytes) throws SerializationException {
        if (bytes == null) {
            return null;
        }

        try (ByteArrayInputStream inputStream = new ByteArrayInputStream(bytes);
             ObjectInputStream objectInputStream = new ObjectInputStream(inputStream);) {
            Object obj = objectInputStream.readObject();
            return obj;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
