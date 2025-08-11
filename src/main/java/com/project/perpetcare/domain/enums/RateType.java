package com.project.perpetcare.domain.enums;

public enum RateType {
    // 시터 평가
    P01("P01", "답장이 빠르고 매너가 좋아요."),
    P02("P02", "아이를 잘 케어해줘요."),
    P03("P03", "시간 약속을 잘 지켜요."),
    P04("P04", "돌봄 서비스 설명이 기재된 내용과 같아요."),
    P05("P05", "특별한 케어를 해줘요."),
    N01("N01", "답장이 느리고 매너가 별로에요."),
    N02("N02", "아이 케어가 잘 이루어지지 않았어요."),
    N03("N03", "시간 약속을 잘 지키지 못해요."),
    N04("N04", "돌봄 서비스 설명이 기재된 내용과 달라요."),
    N05("N05", "아이에게 트라우마가 생겼어요."),

    // 공고자 평가
    P06("P06", "답장이 빠르고 매너가 좋아요."),
    P07("P07", "급여 지급이 빨라요."),
    P08("P08", "시간 약속을 잘 지켜요."),
    P09("P09", "돌봄 근무 내용이 기재된 내용과 같아요."),
    P10("P10", "아이가 친화적이라 어려움이 없어요."),
    N06("N06", "답장이 느리고 매너가 별로에요."),
    N07("N07", "급여 지급이 늦어요."),
    N08("N08", "시간 약속을 잘 지키지 못해요."),
    N09("N09", "돌봄 근무 내용이 기재된 내용과 달라요."),
    N10("N10", "공고자의 과한 서비스 요구가 있어요.");

    private final String code;
    private final String text;

    RateType(String code, String text) {
        this.code = code;
        this.text = text;
    }

    public String getCode() {
        return code;
    }

    public String getText() {
        return text;
    }

    // 코드로 enum 찾기
    public static String getRate(String code) {
        for (RateType r : RateType.values()) {
            if (r.code.equals(code)) {
                return r.text;
            }
        }
        return null; // 해당 코드 없으면 null
    }
}
