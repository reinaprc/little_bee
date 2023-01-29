import React, { memo, useCallback } from "react";
import Login from "./Login";
import FindPw from "./FindPw";
import FindDone from "../../assets/css/profile/FindDoneStyle";
import { Navigate, useNavigate } from "react-router-dom";

const FindIdDone = memo(() => {
    const navigate = useNavigate();

    const onLogin = useCallback((e) => {
        e.preventDefault();
        navigate("/login");
    });

    const onFindPw = useCallback((e) => {
        e.preventDefault();
        navigate("/login/findpw");
    });
    return (
        <FindDone>
            <div>
                <h2>아이디 찾기 완료</h2>

                <p className="signDone">
                    홍길동님의 아이디 찾기가 완료되었습니다.
                </p>
                <p className="signDone">가입된 아이디가 총 @개 있습니다.</p>
                <form>
                    <div className="findDone"></div>

                    <div className="doneProfile">
                        <div className="doneName">
                            <span>이름 : </span>
                            <p>홍길동</p>
                        </div>

                        <div className="doneId">
                            <span>아이디 : </span>
                            <p>hhh123</p>
                        </div>
                    </div>
                </form>
                <div className="doneButton">
                    <button type="submit" className="button" onClick={onLogin}>
                        로그인
                    </button>

                    <button type="submit" className="button" onClick={onFindPw}>
                        비밀번호 찾기
                    </button>
                </div>
            </div>
        </FindDone>
    );
});

export default FindIdDone;
