/**
 * Redux-Slice에서 반복적으로 사용되는 처리로직을 재사용하기 위해 만든 모듈
 */
const pending = (state, { payload }) => {
    return { ...state, loading: true }
};

const fulfilled = (state, { payload }) => {
    // console.group('fulfilled');
    // console.log(payload);
    // console.groupEnd();

    return {
        data: payload.data,
        pagenation: payload.pagenation,
        loading: false,
        error: null
    }
};

const rejected = (state, { payload }) => {
    // console.group("rejected");
    // console.log(payload);
    // console.groupEnd();

    const err = new Error();

    if (typeof payload.data === "string") {
        err.code = payload.status ? payload.status : 500;
        err.name = "React Error";
        err.message = payload.data;
    } else {
        err.code = payload.data.rtcode;
        err.name = payload.data.rt;
        err.message = payload.data.rtmsg;
    }

    return {
        ...state,
        loading: false,
        error: err
    }
};

export { pending, fulfilled, rejected };